import BoomerLib
import ModernRIBs

protocol LoginRouting: ViewableRouting {

}

protocol LoginListener: AnyObject {

}

protocol LoginInteractorParams {
    var gitHubService: GitHubService { get }
}

final class LoginInteractor: Interactor, LoginInteractable, LoginViewListener {
    
    weak var router: LoginRouting?
    weak var listener: LoginListener?
    
    let gitHubService: GitHubService
    
    init(with params: LoginInteractorParams) {
        self.gitHubService = params.gitHubService
    }
    
    // MARK: - LoginViewListener
    
    func loginViewLoginTapped() {
        self.gitHubService.login()
    }
}
