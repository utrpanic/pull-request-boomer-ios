import UIKit

class ViewController: UIViewController {
    
    private var shouldSetupScene: Bool = true
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.shouldSetupScene {
            self.shouldSetupScene = false
            self.setupScene()
        }
    }
    
    func setupScene() {
        
    }
}
