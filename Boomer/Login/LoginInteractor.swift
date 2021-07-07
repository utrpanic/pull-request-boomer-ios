import ModernRIBs

protocol LoginRouting: ViewableRouting {

}

protocol LoginListener: AnyObject {

}

final class LoginInteractor: Interactor, LoginInteractable, LoginViewListener {
    
    weak var router: LoginRouting?
    weak var listener: LoginListener?
    
    // MARK: - LoginViewListener
    func loginViewLoginTapped() {
        
    }
}
