import InterfaceLib
import ModernRIBs

public protocol HomeRouting: ViewableRouting {
    
}

protocol HomeInteractorParams {
    
}

final class HomeInteractor: Interactor, HomeInteractable, HomeViewListener {
    weak var router: HomeRouting?
    weak var listener: HomeListener?
    
    init(params: HomeInteractorParams) {
        
    }
}
