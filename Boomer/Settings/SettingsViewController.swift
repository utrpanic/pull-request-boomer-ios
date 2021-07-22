import SwiftUI

import ModernRIBs

final class SettingsViewController: UIHostingController<SettingsView>, SettingsViewControllable {
    
    weak var listener: SettingsViewListener? {
        set { self.rootView.listener = newValue }
        get { self.rootView.listener }
    }
    
    convenience init() {
        let rootView = SettingsView()
        self.init(rootView: rootView)
        self.setupTabBarItem()
    }
    
    private func setupTabBarItem() {
        self.tabBarItem = UITabBarItem(
            title: "Settings",
            image: UIImage(systemName: "gearshape"),
            selectedImage: nil
        )
    }
}
