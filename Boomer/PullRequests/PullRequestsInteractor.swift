import InterfaceLib
import ModernRIBs

final class PullRequestsInteractor: Interactor, PullRequestsInteractable, PullRequestsViewListener {
    weak var router: PullRequestsRouting?
    weak var listener: PullRequestsListener?
}
