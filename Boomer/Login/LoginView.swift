import SwiftUI

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
