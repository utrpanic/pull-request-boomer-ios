import InterfaceLib
import ModelLib
import ModernRIBs

protocol MainDependency: Dependency {
    var buildables: BuildableProviderProtocol { get }
    
}

final class MainComponent: ComponentInThisWorld<MainDependency>,
                           LoginDependency,
                           HomeDependency,
                           SettingsDependency {
    var buildables: BuildableProviderProtocol { self.dependency.buildables }
}

extension MainComponent: MainRouterParams {
    
    var loginBuilder: LoginBuildable {
        return self.buildables[LoginBuildable.self, dependency: self]
    }
    var pullRequestBuilder: HomeBuildable {
        return self.buildables[HomeBuildable.self, dependency: self]
    }
    var settingsBuilder: SettingsBuildable {
        return self.buildables[SettingsBuildable.self, dependency: self]
    }
}

extension MainComponent: MainInteracterParams {
    var authService: AuthService { AuthService(api: self.world.authApi) }
}

protocol MainBuildable: Buildable {
    func build() -> (LaunchRouting, UrlHandler)
}

final class MainBuilder: BuilderInThisWorld<MainDependency>, MainBuildable {
    
    func build() -> (LaunchRouting, UrlHandler) {
        let component = MainComponent(dependency: self.dependency, in: self.world)
        let interactor = MainInteractor(params: component)
        let viewController = MainViewController()
        let router = MainRouter(
            interactor: interactor,
            viewController: viewController,
            params: component
        )
        return (router, interactor)
    }
}
