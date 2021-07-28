import CommonLib
import ModelLib
import ModernRIBs

private final class AppComponent: EmptyComponent, MainDependency {
    
}

private final class AppDependency: TargetDependency {
    var gitHubApi: GitHubApiProtocol = GitHubApi()
}

protocol MainDependency: Dependency {
    
}

private final class MainComponent: Component<MainDependency>,
                                   LoginDependency,
                                   HomeDependency,
                                   SettingsDependency {
    
}

protocol MainBuildable: Buildable {
    func build() -> (LaunchRouting, UrlHandler)
}

final class MainBuilder: BuilderWithTargetDependency<MainDependency>, MainBuildable {
    
    lazy private var component: MainComponent = MainComponent(dependency: self.dependency)
    
    private var routerParams: MainRouter.Params {
        return MainRouter.Params(
            loginBuilder: LoginBuilder(dependency: self.component, with: self.targetDependency),
            homeBuilder: HomeBuilder(dependency: self.component, with: self.targetDependency),
            settingsBuilder: SettingsBuilder(dependency: self.component, with: self.targetDependency)
        )
    }
    
    private var interactorParams: MainInteractor.Params {
        return MainInteractor.Params(
            gitHubService: GitHubService(api: self.targetDependency.gitHubApi)
        )
    }
    
    init() {
        super.init(dependency: AppComponent(), with: AppDependency())
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
