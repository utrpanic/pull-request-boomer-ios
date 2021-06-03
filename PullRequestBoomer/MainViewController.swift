import UIKit

import BoxKit

enum MainTab: Int, CaseIterable {
    
    case pullRequests
    case settings
    
    var tabBarItem: UITabBarItem {
        switch self {
        case .pullRequests:
            return UITabBarItem(tabBarSystemItem: .featured, tag: self.rawValue)
        case .settings:
            return UITabBarItem(tabBarSystemItem: .more, tag: self.rawValue)
        }
    }
    
    var viewController: UIViewController {
        let viewController: UIViewController = {
            switch self {
            case .pullRequests: return PullRequestsViewController.create()
            case .settings: return SettingsViewController.create()
            }
        }()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = self.tabBarItem
        return navigationController
    }
}

class MainViewController: UITabBarController {
    
    private let eventBus: EventBus = EventBus()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.setupMainTabs()
        
        self.observeLocalEvent()
    }
    
    private func setupMainTabs() {
        self.viewControllers = MainTab.allCases.map { $0.viewController }
    }
    
    private func observeLocalEvent() {
        self.eventBus.observe(AuthFailure.self) { (event) in
            Coordinator.shared.presentLogin()
        }
    }
}
