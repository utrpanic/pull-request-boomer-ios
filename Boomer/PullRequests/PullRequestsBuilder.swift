import InterfaceLib
import ModernRIBs

final class PullRequestsComponent: Component<PullRequestsDependency> {

}

final class PullRequestsBuilder: Builder<PullRequestsDependency>, PullRequestsBuildable {

    func build(withListener listener: PullRequestsListener) -> PullRequestsRouting {
        let interactor = PullRequestsInteractor()
        interactor.listener = listener
        let viewController = PullRequestsViewController()
        _ = PullRequestsComponent(dependency: dependency)
        return PullRequestsRouter(interactor: interactor, viewController: viewController)
    }
}
