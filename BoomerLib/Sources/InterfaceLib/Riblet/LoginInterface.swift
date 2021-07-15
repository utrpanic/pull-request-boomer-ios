import ModernRIBs

public extension RibletName {
    static var login: String { #function }
}

public protocol LoginDependency: Dependency {
    var buildableFactory: BuildableFactoryProtocol { get }
}

public protocol LoginBuildable: Buildable {
    func build(withListener listener: LoginListener) -> LoginRouting
}

public protocol LoginInteractable: Interactable {
    var router: LoginRouting? { get set }
    var listener: LoginListener? { get set }
}

public protocol LoginViewControllable: ViewControllable {

}

public protocol LoginRouting: ViewableRouting {

}

public protocol LoginListener: AnyObject {

}
