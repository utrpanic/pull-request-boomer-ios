import SwiftUI

import BoomerLib

final class MainController: UIHostingController<MainView>, MainViewDelegate {
    
    var service: AuthService = AuthService(api: AuthApi())

    override init(rootView: MainView) {
        super.init(rootView: rootView)
        self.rootView.delegate = self
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func settingsViewLogOutTapped() {
        self.service.logout()
    }
}
