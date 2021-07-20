import ModernRIBs

public protocol World {
    var authApi: AuthApiProtocol { get }
}

public protocol BuildableProviderProtocol {
    subscript<T>(type: T.Type, dependency dependency: Dependency) -> T { get }
}

open class BuilderInThisWorld<DependencyType>: Buildable {
    
    public let dependency: DependencyType
    public let world: World

    public init(dependency: DependencyType, in world: World) {
        self.dependency = dependency
        self.world = world
    }
}

open class ComponentInThisWorld<DependencyType>: Dependency {
    
    public let dependency: DependencyType
    public let world: World

    public init(dependency: DependencyType, in world: World) {
        self.dependency = dependency
        self.world = world
    }
}
