import ModernRIBs

public protocol HasDependencyProvider {
    var buildables: BuildableProviderProtocol { get }
    var apis: ApiProviderProtocol { get }
}

extension Component: HasDependencyProvider where DependencyType: HasDependencyProvider {
    
    public var buildables: BuildableProviderProtocol { self.dependency.buildables }
    public var apis: ApiProviderProtocol { self.dependency.apis }
}

public protocol BuildableProviderProtocol {
    subscript<T>(type: T.Type, dependency dependency: Dependency) -> T { get }
}

public protocol ApiProviderProtocol {
    var auth: AuthApiProtocol { get }
}
