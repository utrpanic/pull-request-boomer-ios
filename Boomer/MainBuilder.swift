import ModernRIBs

protocol MainDependency: Dependency {
    var samIsLoggedIn: Bool { get }
}

final class MainComponent: Component<MainDependency> {

}

protocol MainBuildable: Buildable {
    func build() -> LaunchRouting
}

final class MainBuilder: Builder<MainDependency>, MainBuildable {

    override init(dependency: MainDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        _ = MainComponent(dependency: self.dependency)
        let viewController = MainViewController()
        let interactor = MainInteractor()
        return MainRouter(interactor: interactor, viewController: viewController)
    }
}
