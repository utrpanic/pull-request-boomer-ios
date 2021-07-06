import ModernRIBs

protocol PullRequestsDependency: Dependency {
    
}

final class PullRequestsComponent: Component<PullRequestsDependency> {

}

protocol PullRequestsBuildable: Buildable {
    func build(withListener listener: PullRequestsListener) -> PullRequestsRouting
}

final class PullRequestsBuilder: Builder<PullRequestsDependency>, PullRequestsBuildable {

    override init(dependency: PullRequestsDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: PullRequestsListener) -> PullRequestsRouting {
        _ = PullRequestsComponent(dependency: dependency)
        let viewController = PullRequestsViewController()
        let interactor = PullRequestsInteractor(presenter: viewController)
        interactor.listener = listener
        return PullRequestsRouter(interactor: interactor, viewController: viewController)
    }
}
