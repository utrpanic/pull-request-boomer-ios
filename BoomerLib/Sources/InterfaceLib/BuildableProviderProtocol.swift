import ModernRIBs

public protocol BuildableProviderProtocol {
    
    subscript<T>(type: T.Type, dependency dependency: Dependency) -> T { get }
    
    init(in theWorld: World)
}

open class BuilderInTheWorld<DependencyType>: Buildable {
    
    public let dependency: DependencyType
    public let theWorld: World

    public init(dependency: DependencyType, in theWorld: World) {
        self.dependency = dependency
        self.theWorld = theWorld
    }
}

public protocol World {
    var gitHubApi: GitHubApiProtocol { get }
}

public protocol GitHubApiProtocol: AnyObject {
    
    var authToken: String? { get set }
    
    func login()
}
