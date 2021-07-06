import ModernRIBs

protocol PullRequestsRouting: ViewableRouting {
    
}

protocol PullRequestsPresentable: Presentable {
    var listener: PullRequestsPresentableListener? { get set }
}

protocol PullRequestsListener: AnyObject {
    
}

final class PullRequestsInteractor: PresentableInteractor<PullRequestsPresentable>, PullRequestsInteractable, PullRequestsPresentableListener {

    weak var router: PullRequestsRouting?
    weak var listener: PullRequestsListener?

    override init(presenter: PullRequestsPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }
}
