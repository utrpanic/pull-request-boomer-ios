public class AuthService {
    
    let api: AuthApiProtocol
    
    init(api: AuthApiProtocol) {
        self.api = api
    }
}
