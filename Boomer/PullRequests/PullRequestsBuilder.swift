import InterfaceLib
import ModernRIBs

final class PullRequestsComponent: Component<PullRequestsDependency> {

}

extension PullRequestsComponent: PullRequestsInteractorParams {
    
}

final class PullRequestsBuilder: Builder<PullRequestsDependency>, PullRequestsBuildable {

    func build(withListener listener: PullRequestsListener) -> ViewableRouting {
        let component = PullRequestsComponent(dependency: self.dependency)
        let interactor = PullRequestsInteractor(params: component)
        interactor.listener = listener
        let viewController = PullRequestsViewController()
        return PullRequestsRouter(interactor: interactor, viewController: viewController)
    }
}
