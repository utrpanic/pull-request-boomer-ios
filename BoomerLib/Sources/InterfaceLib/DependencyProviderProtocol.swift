import ModernRIBs

public protocol HasDependencyProvider {
    var apis: ApiProviderProtocol { get }
    var buildables: BuildableProviderProtocol { get }
}

extension Component: HasDependencyProvider {
    
    public var apis: ApiProviderProtocol {
        if let dependency = self.dependency as? HasDependencyProvider {
            return dependency.apis
        } else {
            fatalError()
        }
    }
    
    public var buildables: BuildableProviderProtocol {
        if let dependency = self.dependency as? HasDependencyProvider {
            return dependency.buildables
        } else {
            fatalError()
        }
    }
}

public protocol ApiProviderProtocol {
    var auth: AuthApiProtocol { get }
}

public protocol BuildableProviderProtocol {
    subscript<T>(type: T.Type, dependency dependency: Dependency) -> T { get }
}
