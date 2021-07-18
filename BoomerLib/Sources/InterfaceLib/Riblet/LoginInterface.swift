import ModernRIBs

public protocol LoginBuildable: Buildable {
    func build(withListener listener: LoginListener) -> ViewableRouting
}

public protocol LoginListener: AnyObject {

}
