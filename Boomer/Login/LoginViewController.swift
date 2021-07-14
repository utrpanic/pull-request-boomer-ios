import UIKit
import SwiftUI

import ModernRIBs

protocol LoginViewListener: AnyObject {
    func loginViewLoginTapped()
}

final class LoginViewController: UIHostingController<LoginView>, LoginViewControllable {

    var listener: LoginViewListener? {
        set { self.rootView.listener = newValue }
        get { self.rootView.listener }
    }
    
    convenience init() {
        let rootView = LoginView()
        self.init(rootView: rootView)
    }
}
