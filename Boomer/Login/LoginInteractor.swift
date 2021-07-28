import ModelLib
import ModernRIBs

protocol LoginRouting: ViewableRouting {

}

protocol LoginListener: AnyObject {

}

final class LoginInteractor: Interactor, LoginInteractable, LoginViewListener {
    
    weak var router: LoginRouting?
    weak var listener: LoginListener?
    
    struct Params {
        var gitHubService: GitHubService
    }
    
    let gitHubService: GitHubService
    
    init(with params: Params) {
        self.gitHubService = params.gitHubService
    }
    
    // MARK: - LoginViewListener
    
    func loginViewLoginTapped() {
        self.gitHubService.login()
    }
}
