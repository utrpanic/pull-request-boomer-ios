import ModernRIBs
import BoomerLib

protocol LoginRouting: ViewableRouting {

}

protocol LoginListener: AnyObject {

}

final class LoginInteractor: Interactor, LoginInteractable, LoginViewListener {
    
    weak var router: LoginRouting?
    weak var listener: LoginListener?
    
    let service: AuthService
    
    init(service: AuthService) {
        self.service = service
    }
    
    // MARK: - LoginViewListener
    func loginViewLoginTapped() {
        self.service.login()
    }
}
