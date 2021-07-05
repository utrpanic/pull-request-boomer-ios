import ModernRIBs

protocol RootRouting: ViewableRouting {
    
}

protocol RootListener: AnyObject {
    
}

final class RootInteractor: Interactor, RootInteractable, RootViewListener {
    weak var router: RootRouting?
    weak var listener: RootListener?
}
