import Foundation

class AppState {
    
    static let shared: AppState = AppState()
    
    var loggedIn: Bool {
        get { UserDefaults.standard.bool(forKey: "loggedIn") }
        set { UserDefaults.standard.set(newValue, forKey: "loggedIn") }
    }
    
    private init() {
        // do nothing.
    }
}
