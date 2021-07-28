import InterfaceLib
import ModelLib
import ModernRIBs

protocol MainDependency: Dependency {
    var buildables: BuildableProviderProtocol { get }
    
}

final class MainComponent: Component<MainDependency>,
                           LoginDependency,
                           HomeDependency,
                           SettingsDependency {
    var buildables: BuildableProviderProtocol { self.dependency.buildables }
}

protocol MainBuildable: Buildable {
    func build() -> (LaunchRouting, UrlHandler)
}

final class MainBuilder: BuilderInTheWorld<MainDependency>, MainBuildable {
    
    lazy var component: MainComponent = MainComponent(dependency: self.dependency)
    
    var routerParams: MainRouter.Params {
        return MainRouter.Params(
            loginBuilder: self.dependency.buildables[LoginBuildable.self, dependency: self.component],
            homeBuilder: self.dependency.buildables[HomeBuildable.self, dependency: self.component],
            settingsBuilder: self.dependency.buildables[SettingsBuildable.self, dependency: self.component]
        )
    }
    
    var interactorParams: MainInteractor.Params {
        return MainInteractor.Params(
            gitHubService: GitHubService(api: self.theWorld.gitHubApi)
        )
    }
    
    func build() -> (LaunchRouting, UrlHandler) {
        let interactor = MainInteractor(params: self.interactorParams)
        let viewController = MainViewController()
        let router = MainRouter(
            interactor: interactor,
            viewController: viewController,
            params: self.routerParams
        )
        return (router, interactor)
    }
}
