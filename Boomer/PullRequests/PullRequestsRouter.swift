import ModernRIBs

protocol PullRequestsInteractable: Interactable {
    var router: PullRequestsRouting? { get set }
    var listener: PullRequestsListener? { get set }
}

protocol PullRequestsViewControllable: ViewControllable {
    
}

final class PullRequestsRouter: ViewableRouter<PullRequestsInteractable, PullRequestsViewControllable>, PullRequestsRouting {

    override init(interactor: PullRequestsInteractable, viewController: PullRequestsViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
