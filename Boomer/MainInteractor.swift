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
    var gitHubService: GitHubService { get }
}

final class MainInteractor: Interactor, MainInteractable, MainViewListener {
    
    weak var router: MainRouting?
    weak var listener: MainListener?
    
    var gitHubService: GitHubService
    
    init(params: MainInteracterParams) {
        self.gitHubService = params.gitHubService
    }
    
    override func didBecomeActive() {
        super.didBecomeActive()
        if self.gitHubService.samIsLoggedIn {
            self.router?.setMainTabs()
        } else {
            self.router?.attachLogin()
        }
    }
}

extension MainInteractor: UrlHandler {
    
    func handle(_ url: URL) {
        if self.gitHubService.handleLoginSuccess(url: url) {
            self.router?.setMainTabs()
            self.router?.detachLogin()
        }
    }
}
