import ModernRIBs

public protocol LoginDependency: Dependency, HasDependencyProvider {

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
