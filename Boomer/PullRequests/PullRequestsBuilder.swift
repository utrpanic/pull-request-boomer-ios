import InterfaceLib
import ModernRIBs

final class PullRequestsComponent: Component<PullRequestsDependency> {

}

final class PullRequestsBuilder: Builder<PullRequestsDependency>, PullRequestsBuildable {

    func build(withListener listener: PullRequestsListener) -> PullRequestsRouting {
        _ = PullRequestsComponent(dependency: dependency)
        let interactor = PullRequestsInteractor()
        interactor.listener = listener
        let viewController = PullRequestsViewController()
        return PullRequestsRouter(interactor: interactor, viewController: viewController)
    }
}
