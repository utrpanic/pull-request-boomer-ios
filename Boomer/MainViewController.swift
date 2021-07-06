import UIKit

import ModernRIBs

protocol MainViewListener: AnyObject {
    
}

final class MainViewController: UITabBarController, MainViewControllable {
    
    weak var listener: MainViewListener?
    
    func setTabs(_ tabs: [ViewControllable]) {
        self.viewControllers = tabs.map { $0.ui }
    }
}
