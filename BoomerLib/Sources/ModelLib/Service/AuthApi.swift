import Foundation

import InterfaceLib

public final class AuthApi: AuthApiProtocol {
    
    private let clientId: String = "a01b32cedbcdd0a87450"
    private let clientSecret: String = "0d43065448d388f091f963456e1ba151ee580673"
    private let loginCallback: String = "boomer://login"
    
    public var loginUrl: URL {
        var urlComponents = URLComponents(string: "https://github.com/login/oauth/authorize")!
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: self.clientId),
            URLQueryItem(name: "redirect_uri", value: self.loginCallback),
        ]
        return urlComponents.url!
    }
    
    public init() {
        // do nothing.
    }
}
