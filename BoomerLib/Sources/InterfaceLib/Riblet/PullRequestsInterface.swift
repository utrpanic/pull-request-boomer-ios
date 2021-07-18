import ModernRIBs

public protocol PullRequestsBuildable: Buildable {
    func build(withListener listener: PullRequestsListener) -> ViewableRouting
}

public protocol PullRequestsListener: AnyObject {
    
}
