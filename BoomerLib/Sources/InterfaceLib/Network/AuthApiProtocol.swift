import Foundation

public protocol AuthApiProtocol: AnyObject {
    
    var authToken: String? { get set }
    
    func login()
    func logout()
}
