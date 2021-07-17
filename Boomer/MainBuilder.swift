import InterfaceLib
import ModelLib
import ModernRIBs

protocol MainDependency: Dependency, HasDependencyProvider {
    
}

final class MainComponent: Component<MainDependency>,
                           LoginDependency,
                           PullRequestsDependency,
                           SettingsDependency {
    
}

extension MainComponent: MainRouterParams {
    
    var loginBuilder: LoginBuildable {
        return self.buildables[LoginBuildable.self, dependency: self]
    }
    var pullRequestBuilder: PullRequestsBuildable {
        return self.buildables[PullRequestsBuildable.self, dependency: self]
    }
    var settingsBuilder: SettingsBuildable {
        return self.buildables[SettingsBuildable.self, dependency: self]
    }
}

extension MainComponent: MainInteracterParams {
    var authService: AuthService { AuthService(api: self.apis.auth) }
}

protocol MainBuildable: Buildable {
    func build() -> (LaunchRouting, UrlHandler)
}

final class MainBuilder: Builder<MainDependency>, MainBuildable {

    func build() -> (LaunchRouting, UrlHandler) {
        let component = MainComponent(dependency: self.dependency)
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
