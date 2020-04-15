import UIKit

class Coordinator {
    
    static let shared: Coordinator = Coordinator()
    
    private var top: UIViewController? {
        var top = UIApplication.shared.delegate?.window??.rootViewController
        while let newTop = top?.presentedViewController {
            top = newTop
        }
        return top
    }
    
    private init() {
        
    }
    
    func presentLogin() {
        let viewController = LoginViewController.create()
        self.top?.present(viewController, animated: true, completion: nil)
    }
}
