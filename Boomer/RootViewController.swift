import ModernRIBs
import UIKit

protocol RootViewListener: AnyObject {
    
}

final class RootViewController: UIViewController, RootViewControllable {
    weak var listener: RootViewListener?
}
