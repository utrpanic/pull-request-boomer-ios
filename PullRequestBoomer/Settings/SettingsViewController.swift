import UIKit

import BoxKit

class SettingsViewController: ViewController, NibLoadable {
    
    static func create() -> Self {
        return self.create(storyboardName: "Settings")!
    }
    
    override func setupScene() {
        super.setupScene()
        
        self.setupNavigation()
    }
    
    private func setupNavigation() {
        self.navigationItem.title = "Settings"
    }
}
