import ModernRIBs

public protocol HasDependencyProvider {
    var buildables: BuildableProviderProtocol { get }
    var apis: ApiProviderProtocol { get }
}

extension Component: HasDependencyProvider {
    
    public var buildables: BuildableProviderProtocol {
        if let dependency = self.dependency as? HasDependencyProvider {
            return dependency.buildables
        } else {
            fatalError()
        }
    }
    
    public var apis: ApiProviderProtocol {
        if let dependency = self.dependency as? HasDependencyProvider {
            return dependency.apis
        } else {
            fatalError()
        }
    }
}

public protocol BuildableProviderProtocol {
    subscript<T>(type: T.Type, dependency dependency: Dependency) -> T { get }
}

public protocol ApiProviderProtocol {
    var auth: AuthApiProtocol { get }
}
