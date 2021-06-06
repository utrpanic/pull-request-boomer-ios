import Foundation

public class AuthService {
    
    private let api: AuthApiProtocol
    private let userDefaults: UserDefaults = .standard
    
    public var loginUrl: URL { self.api.loginUrl }
    
    private var authToken: String? {
        get { self.userDefaults.string(forKey: "authToken") }
        set { self.userDefaults.setValue(newValue, forKey: "authToken") }
    }
    
    public var samIsLoggedIn: Bool { self.authToken != nil }
    
    public init(api: AuthApiProtocol) {
        self.api = api
    }
    
    public func handleLoginSuccess(url: URL) -> Bool {
        let urlComponents = URLComponents(string: url.absoluteString)
        guard urlComponents?.scheme == "boomer" else { return false }
        guard urlComponents?.host == "login" else { return false }
        let quries = urlComponents?.queryItems ?? []
        let authToken = quries.filter { $0.name == "code" }.first?.value
        self.authToken = authToken
        return true
    }
}
