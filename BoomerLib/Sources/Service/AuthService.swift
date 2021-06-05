import Foundation

public class AuthService {
    
    private let api: AuthApiProtocol
    
    public var loginUrl: URL { self.api.loginUrl }
    
    public init(api: AuthApiProtocol) {
        self.api = api
    }
}
