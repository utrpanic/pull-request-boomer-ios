import ModelLib
import InterfaceLib
import ModernRIBs

final class LoginComponent: Component<LoginDependency> {

}

final class LoginBuilder: Builder<LoginDependency>, LoginBuildable {

    func build(withListener listener: LoginListener) -> LoginRouting {
        let service = AuthService(api: AuthApi())
        let interactor = LoginInteractor(service: service)
        interactor.listener = listener
        let viewController = LoginViewController()
        viewController.listener = interactor
        _ = LoginComponent(dependency: dependency)
        return LoginRouter(interactor: interactor, viewController: viewController)
    }
}
