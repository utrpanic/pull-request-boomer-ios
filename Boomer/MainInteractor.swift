import Combine
import UIKit

import ModelLib
import ModernRIBs

protocol MainRouting: ViewableRouting {
    func attachLogin()
    func detachLogin()
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
    
    init(with params: MainInteracterParams) {
        self.authService = params.authService
    }
    
    override func didBecomeActive() {
        super.didBecomeActive()
        self.router?.attachLogin()
    }
}
