import UIKit

import InterfaceLib
import ModernRIBs

protocol HomeViewListener: AnyObject {

}

final class HomeViewController: UIViewController, HomeViewControllable {
    
    weak var listener: HomeViewListener?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupTabBarItem()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.setupTabBarItem()
    }
    
    private func setupTabBarItem() {
        self.tabBarItem = UITabBarItem(
            title: "Pull Requests",
            image: UIImage(systemName: "list.bullet"),
            selectedImage: nil
        )
    }
}
