import UIKit

import ModernRIBs

final class NavigationControllable: ViewControllable {
    
    var uiviewController: UIViewController { self.uinavigationController }
    var uinavigationController: UINavigationController

    init(root: ViewControllable) {
        self.uinavigationController = UINavigationController(rootViewController: root.uiviewController)
    }
}

extension ViewControllable {

    var ui: UIViewController { self.uiviewController }

    func presentViewControllable(_ viewControllable: ViewControllable, animated: Bool, style: UIModalPresentationStyle? = nil, completion: (() -> Void)? = nil) {
        let presenting = self.ui
        let viewController = viewControllable.ui
        if let modalPresentationStyle = style {
            viewController.modalPresentationStyle = modalPresentationStyle
        }
        presenting.present(viewController, animated: animated, completion: completion)
    }

    func dismissViewControllable(_ viewControllable: ViewControllable, animated: Bool, completion: (() -> Void)? = nil) {
        let viewController = viewControllable.ui
        guard viewController.isBeingRemoved == false else { return }
        guard let presenting = viewController.presentingViewController else { return }
        presenting.dismiss(animated: animated, completion: completion)
    }

    func pushViewControllable(_ viewControllable: ViewControllable, animated: Bool) {
        guard let navigation = self.ui.navigationController else { return }
        let viewController = viewControllable.ui
        navigation.pushViewController(viewController, animated: animated)
    }

    func popViewControllable(_ viewControllable: ViewControllable, animated: Bool) {
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

    func hasNoChild<T>(typeOf type: T.Type) -> Bool {
        return self.children.contains { $0 is T } == false
    }

    func lastChild<T>(typeOf type: T.Type) -> T? {
        return self.children.last { $0 is T } as? T
    }
}
