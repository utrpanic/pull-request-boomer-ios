import BoomerLib
import ModernRIBs

@testable import Boomer

final class GitHubApiMock: GitHubApiProtocol {
    
    var authToken: String? = nil
    
    lazy var loggedIn: () -> Bool = {
        preconditionFailure()
    }
    
    lazy var login: () -> Void = {
        preconditionFailure()
    }
}
