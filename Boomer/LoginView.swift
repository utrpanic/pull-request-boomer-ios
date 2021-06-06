import SwiftUI

protocol LoginViewDelegate: AnyObject {
    func loginViewLoginTapped()
}

struct LoginView: View {
    
    weak var delegate: LoginViewDelegate?
    
    var body: some View {
        Button("GitHub Login") {
            self.delegate?.loginViewLoginTapped()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
