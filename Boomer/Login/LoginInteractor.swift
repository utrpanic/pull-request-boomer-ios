import ModelLib
import ModernRIBs

protocol LoginRouting: ViewableRouting {

}

protocol LoginListener: AnyObject {

}

protocol LoginInteractorParams {
    var authService: AuthService { get }
}

final class LoginInteractor: Interactor, LoginInteractable, LoginViewListener {
    
    weak var router: LoginRouting?
    weak var listener: LoginListener?
    
    let service: AuthService
    
    init(with params: LoginInteractorParams) {
        self.service = params.authService
    }
    
    // MARK: - LoginViewListener
    
    func loginViewLoginTapped() {
        self.service.login()
    }
}
