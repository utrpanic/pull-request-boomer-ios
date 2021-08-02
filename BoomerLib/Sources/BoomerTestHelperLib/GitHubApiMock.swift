import BoomerLib
import ModernRIBs

public final class GitHubApiMock: GitHubApiProtocol {
    
    public var authToken: String? = nil
    
    public lazy var loggedIn: () -> Bool = {
        preconditionFailure()
    }
    
    public lazy var login: () -> Void = {
        preconditionFailure()
    }
    
    public init() {
        
    }
}
