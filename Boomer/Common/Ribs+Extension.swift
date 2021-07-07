import UIKit

import ModernRIBs

extension ViewControllable {
    
    var ui: UIViewController { self.uiviewController }
    
    func presentFullScreen(_ viewControllable: ViewControllable, animated: Bool, completion: (() -> Void)?) {
        viewControllable.ui.modalPresentationStyle = .fullScreen
        self.ui.present(viewControllable.ui, animated: animated, completion: completion)
    }
}
