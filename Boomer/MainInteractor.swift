import ModernRIBs

protocol MainRouting: ViewableRouting {
    func routeToLogin()
}

protocol MainListener: AnyObject {
    
}

final class MainInteractor: Interactor, MainInteractable, MainViewListener {
    weak var router: MainRouting?
    weak var listener: MainListener?
    
    override func didBecomeActive() {
        super.didBecomeActive()
//        self.router?.routeToLogin()
    }
}
