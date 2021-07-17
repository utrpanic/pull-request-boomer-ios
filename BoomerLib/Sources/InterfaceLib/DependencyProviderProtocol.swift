import ModernRIBs

public protocol BuildableProviderProtocol {
    subscript<T>(type: T.Type, dependency dependency: Dependency) -> T { get }
}

public protocol ApiProviderProtocol {
    var auth: AuthApiProtocol { get }
}
