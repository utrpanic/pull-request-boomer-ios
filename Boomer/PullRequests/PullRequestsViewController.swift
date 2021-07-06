import ModernRIBs
import UIKit

protocol PullRequestsPresentableListener: AnyObject {

}

final class PullRequestsViewController: UIViewController, PullRequestsPresentable, PullRequestsViewControllable {
    
    weak var listener: PullRequestsPresentableListener?
    
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
            image: UIImage(systemName: "phone.fill"),
            selectedImage: nil
        )
    }
}
