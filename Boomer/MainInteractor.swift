import Combine
import UIKit

import ModelLib
import ModernRIBs

protocol MainRouting: ViewableRouting {
    func attachLogin()
    func detachLogin()
    func setMainTabs()
}

protocol MainListener: AnyObject {
    
}

protocol MainInteracterParams {
    var authService: AuthService { get }
}

final class MainInteractor: Interactor, MainInteractable, MainViewListener {
    
    weak var router: MainRouting?
    weak var listener: MainListener?
    
    var authService: AuthService
    
    init(params: MainInteracterParams) {
        self.authService = params.authService
    }
    
    override func didBecomeActive() {
        super.didBecomeActive()
        if self.authService.samIsLoggedIn {
            self.router?.setMainTabs()
        } else {
            self.router?.attachLogin()
        }
    }
}

extension MainInteractor: UrlHandler {
    
    func handle(_ url: URL) {
        if self.authService.handleLoginSuccess(url: url) {
            self.router?.setMainTabs()
            self.router?.detachLogin()
        }
    }
}
