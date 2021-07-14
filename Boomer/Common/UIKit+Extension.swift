import UIKit

extension UIViewController {
    
    var isBeingRemoved: Bool {
        return self.isBeingDismissed || self.isMovingFromParent || (self.navigationController?.isBeingDismissed == true)
    }
}
