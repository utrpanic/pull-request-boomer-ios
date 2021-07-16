import ModernRIBs

public extension RibletName {
    static var pullRequests: String { #function }
}

public protocol PullRequestsDependency: Dependency {
    var provider: CommonDependencyProviderProtocol { get }
}

public protocol PullRequestsBuildable: Buildable {
    func build(withListener listener: PullRequestsListener) -> PullRequestsRouting
}

public protocol PullRequestsInteractable: Interactable {
    var router: PullRequestsRouting? { get set }
    var listener: PullRequestsListener? { get set }
}

public protocol PullRequestsViewControllable: ViewControllable {
    
}

public protocol PullRequestsRouting: ViewableRouting {
    
}

public protocol PullRequestsListener: AnyObject {
    
}
