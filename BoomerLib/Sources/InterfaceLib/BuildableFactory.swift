import ModernRIBs

public protocol BuildableFactoryProtocol {
    
    var authApi: AuthApiProtocol { get }
    
    func create(ribletName: String, dependency: Dependency) -> Buildable
}

public struct RibletName {
    
}
