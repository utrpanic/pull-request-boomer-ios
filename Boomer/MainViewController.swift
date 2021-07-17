import UIKit

import ModernRIBs

protocol MainViewListener: AnyObject {
    
}

final class MainViewController: UITabBarController, MainViewControllable {
    
    weak var launchView: UIView?

    weak var listener: MainViewListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemBackground
        self.tabBar.backgroundColor = UIColor.secondarySystemBackground
        self.showLaunchView()
    }
    
    // MARK: - MainControllable
    
    func showLaunchView() {
        guard self.launchView == nil else { return }
        let storyboard = UIStoryboard(name: "LaunchScreen", bundle: nil)
        let viewConroller = storyboard.instantiateInitialViewController()
        guard let launchView = viewConroller?.view else { return }
        self.view.addSubview(launchView)
        self.launchView = launchView
    }
    
    func hideLaunchView() {
        guard self.launchView != nil else { return }
        UIView.animate(withDuration: 0.2) {
            self.launchView?.alpha = 0
        } completion: { _ in
            self.launchView?.removeFromSuperview()
        }
    }
    
    func setTabs(_ tabs: [ViewControllable]) {
        self.viewControllers = tabs.map { $0.ui }
    }
}
