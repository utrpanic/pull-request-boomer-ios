import ModernRIBs

public protocol BuildableProviderProtocol {
    
    subscript<T>(type: T.Type, dependency dependency: Dependency) -> T { get }
    
    init(in world: World)
}

open class ComponentInThisWorld<DependencyType> {
    
    public let dependency: DependencyType
    public let world: World

    public init(dependency: DependencyType, in world: World) {
        self.dependency = dependency
        self.world = world
    }
}

open class BuilderInThisWorld<DependencyType>: Buildable {
    
    public let dependency: DependencyType
    public let world: World

    public init(dependency: DependencyType, in world: World) {
        self.dependency = dependency
        self.world = world
    }
}

public protocol World {
    var gitHubApi: GitHubApiProtocol { get }
}

public protocol GitHubApiProtocol: AnyObject {
    
    var authToken: String? { get set }
    
    func login()
}
