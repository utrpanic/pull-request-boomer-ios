import InterfaceLib
import ModelLib
import ModernRIBs

protocol MainDependency: Dependency {
    var buildableFactory: BuildableFactoryProtocol { get }
    var samIsLoggedIn: Bool { get }
}

final class MainComponent: Component<MainDependency>,
                           LoginDependency,
                           PullRequestsDependency,
                           SettingsDependency {
    var buildableFactory: BuildableFactoryProtocol { self.dependency.buildableFactory }
}

extension MainComponent: MainRouterParams {
    var loginBuilder: LoginBuildable {
        return self.buildableFactory.create(ribletName: RibletName.login, dependency: self) as! LoginBuildable
    }
    var pullRequestBuilder: PullRequestsBuildable {
        return self.buildableFactory.create(ribletName: RibletName.pullRequests, dependency: self) as! PullRequestsBuildable
    }
    var settingsBuilder: SettingsBuildable {
        return self.buildableFactory.create(ribletName: RibletName.settings, dependency: self) as! SettingsBuildable
    }
}

extension MainComponent: MainInteracterParams {
    var authService: AuthService { AuthService(api: self.buildableFactory.authApi) }
}

protocol MainBuildable: Buildable {
    func build() -> MainRouting
}

final class MainBuilder: Builder<MainDependency>, MainBuildable {

    func build() -> MainRouting {
        let component = MainComponent(dependency: self.dependency)
        let interactor = MainInteractor(with: component)
        let viewController = MainViewController()
        return MainRouter(
            interactor: interactor,
            viewController: viewController,
            params: component
        )
    }
}
