import SwiftUI

protocol LoginViewListener: AnyObject {
    func loginViewLoginTapped()
}

struct LoginView: View {
    
    weak var listener: LoginViewListener?
    
    var body: some View {
        Button("GitHub Login") {
            self.listener?.loginViewLoginTapped()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
