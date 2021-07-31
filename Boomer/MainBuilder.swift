import BoomerLib
import ModernRIBs

private class AppComponent: EmptyComponent, MainDependency {
    let common: CommonDependency = CommonDependency(
        gitHubApi: GitHubApi()
    )
}

protocol MainDependency: Dependency {
    var common: CommonDependency { get }
}

private final class MainComponent: Component<MainDependency>,
                                   LoginDependency,
                                   HomeDependency,
                                   SettingsDependency {
    var common: CommonDependency { self.dependency.common }
}

extension MainComponent: MainInteractorParams, MainRouterParams {
    
    var gitHubService: GitHubService {
        return GitHubService(api: self.dependency.common.gitHubApi)
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
