import ModernRIBs

protocol LoginDependency: Dependency {

}

final class LoginComponent: Component<LoginDependency> {

}

protocol LoginBuildable: Buildable {
    func build(withListener listener: LoginListener) -> LoginRouting
}

final class LoginBuilder: Builder<LoginDependency>, LoginBuildable {

    override init(dependency: LoginDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LoginListener) -> LoginRouting {
        let interactor = LoginInteractor()
        interactor.listener = listener
        let viewController = LoginViewController()
        _ = LoginComponent(dependency: dependency)
        return LoginRouter(interactor: interactor, viewController: viewController)
    }
}
