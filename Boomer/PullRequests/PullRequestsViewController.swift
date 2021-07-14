import UIKit

import ModernRIBs

protocol PullRequestsViewListener: AnyObject {

}

final class PullRequestsViewController: UIViewController, PullRequestsViewControllable {
    
    weak var listener: PullRequestsViewListener?
    
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
            title: "PullRequests",
            image: UIImage(systemName: "list.bullet"),
            selectedImage: nil
        )
    }
}
