import SwiftUI

import ModernRIBs

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
