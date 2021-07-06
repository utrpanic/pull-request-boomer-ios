import ModernRIBs

protocol MainDependency: Dependency {
    var samIsLoggedIn: Bool { get }
}

final class MainComponent: Component<MainDependency>, PullRequestsDependency, SettingsDependency {

}

protocol MainBuildable: Buildable {
    func build() -> LaunchRouting
}

final class MainBuilder: Builder<MainDependency>, MainBuildable {

    override init(dependency: MainDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let interactor = MainInteractor()
        let viewController = MainViewController()
        let component = MainComponent(dependency: self.dependency)
        let pullRequestsBuilder = PullRequestsBuilder(dependency: component)
        let settingsBuilder = SettingsBuilder(dependency: component)
        return MainRouter(
            interactor: interactor,
            viewController: viewController,
            pullRequestsBuilder: pullRequestsBuilder,
            settingsBuilder: settingsBuilder
        )
    }
}
