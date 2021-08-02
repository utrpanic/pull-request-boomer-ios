import UIKit

import ModernRIBs

public final class NavigationControllable: ViewControllable {
    
    public var uiviewController: UIViewController { self.uinavigationController }
    public var uinavigationController: UINavigationController
    
    public init(root: ViewControllable) {
        self.uinavigationController = UINavigationController(rootViewController: root.uiviewController)
    }
}

extension ViewControllable {
    
    public var ui: UIViewController { self.uiviewController }
    
    public func presentViewControllable(_ viewControllable: ViewControllable, animated: Bool, style: UIModalPresentationStyle? = nil, completion: (() -> Void)? = nil) {
        let presenting = self.ui
        let viewController = viewControllable.ui
        if let modalPresentationStyle = style {
            viewController.modalPresentationStyle = modalPresentationStyle
        }
        presenting.present(viewController, animated: animated, completion: completion)
    }
    
    public func dismissViewControllable(_ viewControllable: ViewControllable, animated: Bool, completion: (() -> Void)? = nil) {
        let viewController = viewControllable.ui
        guard viewController.isBeingRemoved == false else { return }
        guard let presenting = viewController.presentingViewController else { return }
        presenting.dismiss(animated: animated, completion: completion)
    }
    
    public func pushViewControllable(_ viewControllable: ViewControllable, animated: Bool) {
        guard let navigation = self.ui.navigationController else { return }
        let viewController = viewControllable.ui
        navigation.pushViewController(viewController, animated: animated)
    }
    
    public func popViewControllable(_ viewControllable: ViewControllable, animated: Bool) {
        let viewController = viewControllable.ui
        guard viewController.isBeingRemoved == false else { return }
        guard let navigation = viewController.navigationController else { return }
        let viewControllerIndex = navigation.children.lastIndex(of: viewController)
        let targetViewControllerIndex = (viewControllerIndex ?? 0) - 1
        guard targetViewControllerIndex >= 0 else { return }
        let targetViewController = navigation.children[targetViewControllerIndex]
        navigation.popToViewController(targetViewController, animated: animated)
    }
}

extension Router {
    
    public func hasNoChild<T>(typeOf type: T.Type) -> Bool {
        return self.children.contains { $0 is T } == false
    }
    
    public func lastChild<T>(typeOf type: T.Type) -> T? {
        return self.children.last { $0 is T } as? T
    }
}
