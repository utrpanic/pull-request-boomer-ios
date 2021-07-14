import ModernRIBs

protocol PullRequestsRouting: ViewableRouting {
    
}

protocol PullRequestsListener: AnyObject {
    
}

final class PullRequestsInteractor: Interactor, PullRequestsInteractable, PullRequestsViewListener {
    weak var router: PullRequestsRouting?
    weak var listener: PullRequestsListener?
}
