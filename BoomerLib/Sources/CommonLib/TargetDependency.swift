import ModernRIBs

public protocol TargetDependency {
    var gitHubApi: GitHubApiProtocol { get }
}

open class BuilderWithTargetDependency<DependencyType>: Buildable {
    
    public let dependency: DependencyType
    public let targetDependency: TargetDependency

    public init(dependency: DependencyType, with target: TargetDependency) {
        self.dependency = dependency
        self.targetDependency = target
    }
}

public protocol GitHubApiProtocol: AnyObject {
    
    var authToken: String? { get set }
    
    func login()
}
