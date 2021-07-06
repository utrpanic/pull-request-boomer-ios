import SwiftUI

protocol SettingsViewDelegate: AnyObject {
    func settingsViewLogOutTapped()
}

struct SettingsView: View {
    
    weak var delegate: SettingsViewDelegate?
    
    init(delegate: SettingsViewDelegate?) {
        self.delegate = delegate
    }
    
    var body: some View {
        VStack {
            Text("Settings")
            Button("LogOut") {
                self.delegate?.settingsViewLogOutTapped()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(delegate: nil)
    }
}
