import CommonLib
import ModelLib
import ModernRIBs

private class AppComponent: EmptyComponent, MainDependency {
    
}

protocol MainDependency: Dependency {
    
}

final class MainComponent: Component<MainDependency>,
                           LoginDependency,
                           HomeDependency,
                           SettingsDependency {
    
}

protocol MainBuildable: Buildable {
    func build() -> (LaunchRouting, UrlHandler)
}

final class MainBuilder: BuilderWithTargetDependency<MainDependency>, MainBuildable {
    
    lazy var component: MainComponent = MainComponent(dependency: self.dependency)
    
    var routerParams: MainRouter.Params {
        return MainRouter.Params(
            loginBuilder: LoginBuilder(dependency: self.component, with: self.targetDependency),
            homeBuilder: HomeBuilder(dependency: self.component, with: self.targetDependency),
            settingsBuilder: SettingsBuilder(dependency: self.component, with: self.targetDependency)
        )
    }
    
    var interactorParams: MainInteractor.Params {
        return MainInteractor.Params(
            gitHubService: GitHubService(api: self.targetDependency.gitHubApi)
        )
    }
    
    init(with targetDependency: TargetDependency) {
        super.init(dependency: AppComponent(), with: targetDependency)
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
