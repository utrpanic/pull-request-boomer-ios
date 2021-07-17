import ModernRIBs

public protocol LoginDependency: Dependency, HasDependencyProvider {

}

public protocol LoginBuildable: Buildable {
    func build(withListener listener: LoginListener) -> ViewableRouting
}

public protocol LoginListener: AnyObject {

}
