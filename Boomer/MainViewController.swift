import UIKit

import ModernRIBs

protocol MainViewListener: AnyObject {
    
}

final class MainViewController: UITabBarController, MainViewControllable {
    
    weak var listener: MainViewListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemBackground
        self.tabBar.backgroundColor = UIColor.secondarySystemBackground
    }
    
    func setTabs(_ tabs: [ViewControllable]) {
        self.viewControllers = tabs.map { $0.ui }
    }
}
