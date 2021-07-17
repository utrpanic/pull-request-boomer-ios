import ModelLib
import InterfaceLib
import ModernRIBs

final class LoginComponent: Component<LoginDependency> {
    
}

extension LoginComponent: LoginInteractorParams {
    var authService: AuthService { AuthService(api: self.apis.auth) }
}

final class LoginBuilder: Builder<LoginDependency>, LoginBuildable {

    func build(withListener listener: LoginListener) -> ViewableRouting {
        let component = LoginComponent(dependency: self.dependency)
        let interactor = LoginInteractor(with: component)
        interactor.listener = listener
        let viewController = LoginViewController()
        viewController.listener = interactor
        return LoginRouter(interactor: interactor, viewController: viewController)
    }
}
