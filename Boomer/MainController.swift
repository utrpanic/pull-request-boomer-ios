import SwiftUI

final class MainController: UIHostingController<MainView>, MainViewDelegate {
    
    override init(rootView: MainView) {
        super.init(rootView: rootView)
        self.rootView.delegate = self
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
