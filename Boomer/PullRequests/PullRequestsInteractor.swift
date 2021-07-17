import InterfaceLib
import ModernRIBs

public protocol PullRequestsRouting: ViewableRouting {
    
}

protocol PullRequestsInteractorParams {
    
}

final class PullRequestsInteractor: Interactor, PullRequestsInteractable, PullRequestsViewListener {
    weak var router: PullRequestsRouting?
    weak var listener: PullRequestsListener?
    
    init(params: PullRequestsInteractorParams) {
        
    }
}
