import SwiftUI

protocol SettingsViewListener: AnyObject {
    func settingsViewLogOutTapped()
}

struct SettingsView: View {
    
    weak var listener: SettingsViewListener?
    
    var body: some View {
        VStack {
            Text("Settings")
            Button("LogOut") {
                self.listener?.settingsViewLogOutTapped()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
