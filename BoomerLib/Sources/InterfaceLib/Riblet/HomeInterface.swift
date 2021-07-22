import ModernRIBs

public protocol HomeBuildable: Buildable {
    func build(withListener listener: HomeListener) -> ViewableRouting
}

public protocol HomeListener: AnyObject {
    
}
