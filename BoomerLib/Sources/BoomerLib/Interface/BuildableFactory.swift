import BoxKit
import ModernRIBs

public protocol BuildableFactoryProtocol {
    func create(ribletName: String, dependency: Dependency) -> Buildable
}

public struct RibletName {
    
}
