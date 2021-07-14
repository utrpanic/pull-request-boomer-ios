import Combine
import UIKit

import BoomerLib
import ModernRIBs

protocol MainRouting: ViewableRouting {
    func attachLogin()
    func detachLogin()
}

protocol MainListener: AnyObject {
    
}

final class MainInteractor: Interactor, MainInteractable, MainViewListener {
    weak var router: MainRouting?
    weak var listener: MainListener?
    
    override func didBecomeActive() {
        super.didBecomeActive()
        self.router?.attachLogin()
    }
}
