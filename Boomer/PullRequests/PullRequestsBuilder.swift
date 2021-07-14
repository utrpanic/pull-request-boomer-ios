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
        let interactor = PullRequestsInteractor()
        interactor.listener = listener
        let viewController = PullRequestsViewController()
        _ = PullRequestsComponent(dependency: dependency)
        return PullRequestsRouter(interactor: interactor, viewController: viewController)
    }
}
