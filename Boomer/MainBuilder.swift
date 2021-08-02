import BoomerLib
import LoginRibs
import ModernRIBs

private class AppComponent: EmptyComponent, MainDependency {
    let apis: AppApis = AppApis(
        gitHub: GitHubApi()
    )
}

protocol MainDependency: Dependency {
    var apis: AppApis { get }
}

private final class MainComponent: Component<MainDependency>,
                                   LoginDependency,
                                   HomeDependency,
                                   SettingsDependency {
    var apis: AppApis { self.dependency.apis }
    var loginApis: LoginApis { self.dependency.apis }
}

extension MainComponent: MainInteractorParams, MainRouterParams {
    
    var gitHubService: GitHubService {
        return GitHubService(api: self.dependency.apis.gitHub)
    }
    
    var loginBuilder: LoginBuildable { LoginBuilder(dependency: self) }
    var homeBuilder: HomeBuildable { HomeBuilder(dependency: self) }
    var settingsBuilder: SettingsBuildable { SettingsBuilder(dependency: self) }
}

protocol MainBuildable: Buildable {
    func build() -> (LaunchRouting, UrlHandler)
}

final class MainBuilder: Builder<MainDependency>, MainBuildable {
    
    convenience init() {
        self.init(dependency: AppComponent())
    }
    
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
