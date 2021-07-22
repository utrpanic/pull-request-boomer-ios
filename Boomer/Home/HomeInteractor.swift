import ModernRIBs

protocol HomeRouting: ViewableRouting {
    
}

protocol HomeListener: AnyObject {
    
}

protocol HomeInteractorParams {
    
}

final class HomeInteractor: Interactor, HomeInteractable, HomeViewListener {
    weak var router: HomeRouting?
    weak var listener: HomeListener?
    
    init(params: HomeInteractorParams) {
        
    }
}
