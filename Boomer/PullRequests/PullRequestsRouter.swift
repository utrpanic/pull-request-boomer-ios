import InterfaceLib
import ModernRIBs

final class PullRequestsRouter: ViewableRouter<PullRequestsInteractable, PullRequestsViewControllable>, PullRequestsRouting {

    override init(interactor: PullRequestsInteractable, viewController: PullRequestsViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
