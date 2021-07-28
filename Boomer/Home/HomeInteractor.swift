import ModernRIBs

protocol HomeRouting: ViewableRouting {
    
}

protocol HomeListener: AnyObject {
    
}

final class HomeInteractor: Interactor, HomeInteractable, HomeViewListener {
    
    weak var router: HomeRouting?
    weak var listener: HomeListener?
    
    struct Params {
        
    }
    
    init(params: Params) {
        
    }
}
