import BoomerLib
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

extension MainComponent: MainRouterDependency {
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

protocol MainBuildable: Buildable {
    func build() -> MainRouting
}

final class MainBuilder: Builder<MainDependency>, MainBuildable {

    func build() -> MainRouting {
        let interactor = MainInteractor()
        let viewController = MainViewController()
        let component = MainComponent(dependency: self.dependency)
        return MainRouter(
            interactor: interactor,
            viewController: viewController,
            dependency: component
        )
    }
}
