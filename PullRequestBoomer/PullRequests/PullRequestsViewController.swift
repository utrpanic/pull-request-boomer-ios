import UIKit

import BoxKit

class PullRequestsViewController: ViewController, NibLoadable {
    
    static func create() -> Self {
        return self.create(storyboardName: "PullRequests")!
    }
}
