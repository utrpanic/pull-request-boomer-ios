import ModernRIBs
import UIKit

protocol SettingsPresentableListener: AnyObject {
    
}

final class SettingsViewController: UIViewController, SettingsPresentable, SettingsViewControllable {
    
    weak var listener: SettingsPresentableListener?
    
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
            title: "Settings",
            image: UIImage(systemName: "phone.fill"),
            selectedImage: nil
        )
    }
}
