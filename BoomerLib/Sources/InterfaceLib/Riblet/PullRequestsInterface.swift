import ModernRIBs

public protocol PullRequestsDependency: Dependency, HasDependencyProvider {
    
}

public protocol PullRequestsBuildable: Buildable {
    func build(withListener listener: PullRequestsListener) -> ViewableRouting
}

public protocol PullRequestsListener: AnyObject {
    
}
