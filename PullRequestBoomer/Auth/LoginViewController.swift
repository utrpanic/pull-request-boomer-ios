import UIKit

import BoxKit

class LoginViewController: ViewController, NibLoadable {
    
    static func create() -> Self {
        return self.create(storyboardName: "Auth")!
    }
    
    override func setupScene() {
        super.setupScene()
        
    }
}
