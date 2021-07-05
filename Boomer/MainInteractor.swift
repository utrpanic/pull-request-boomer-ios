import ModernRIBs

protocol MainRouting: ViewableRouting {
    
}

protocol MainListener: AnyObject {
    
}

final class MainInteractor: Interactor, MainInteractable, MainViewListener {
    weak var router: MainRouting?
    weak var listener: MainListener?
}
