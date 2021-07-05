import UIKit

import ModernRIBs

protocol MainViewListener: AnyObject {
    
}

final class MainViewController: UIViewController, MainViewControllable {
    weak var listener: MainViewListener?
}
