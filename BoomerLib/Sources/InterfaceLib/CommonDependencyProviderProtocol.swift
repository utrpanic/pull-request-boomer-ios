import ModernRIBs

public protocol CommonDependencyProviderProtocol {
    
    var authApi: AuthApiProtocol { get }
    
    func builder(of ribletName: String, dependency: Dependency) -> Buildable
}

public struct RibletName {
    
}
