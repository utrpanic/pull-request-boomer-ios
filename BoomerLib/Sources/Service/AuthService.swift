public class AuthService {
    
    private let api: AuthApiProtocol
    
    public init(api: AuthApiProtocol) {
        self.api = api
    }
}
