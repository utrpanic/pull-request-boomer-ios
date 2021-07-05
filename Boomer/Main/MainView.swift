import SwiftUI

protocol MainViewDelegate: SettingsViewDelegate {
    
}

struct MainView: View {
    
    weak var delegate: MainViewDelegate?
    
    var body: some View {
        TabView {
            PullRequestsView()
                .tabItem {
                    Image(systemName: "phone.fill")
                    Text("First Tab")
                }
            SettingsView(delegate: self.delegate)
                .tabItem {
                    Image(systemName: "tv.fill")
                    Text("Second Tab")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
