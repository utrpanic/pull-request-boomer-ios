import UIKit

import BoxKit

class PullRequestsViewController: ViewController, NibLoadable {
    
    static func create() -> Self {
        return self.create(storyboardName: "PullRequests")!
    }
    
    override func setupScene() {
        super.setupScene()
        
        self.setupNavigation()
    }
    
    private func setupNavigation() {
        self.navigationItem.title = "PullRequests"
    }
}
