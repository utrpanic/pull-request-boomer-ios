import UIKit

import BoxKit

class SettingsViewController: ViewController, NibLoadable {
    
    static func create() -> Self {
        return self.create(storyboardName: "Settings")!
    }
}
