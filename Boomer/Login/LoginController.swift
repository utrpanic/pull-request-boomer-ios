import SwiftUI

import BoomerLib

class LoginController: UIHostingController<LoginView>, LoginViewDelegate {
    
    var service: AuthService = AuthService(api: AuthApi())
    
    override init(rootView: LoginView) {
        super.init(rootView: rootView)
        self.rootView.delegate = self
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LoginViewListener
    func loginViewLoginTapped() {
        self.service.login()
    }    
}
