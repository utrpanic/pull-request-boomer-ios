import ModelLib
import InterfaceLib
import ModernRIBs

final class LoginComponent: Component<LoginDependency> {
    var provider: CommonDependencyProviderProtocol { self.dependency.provider }
}

extension LoginComponent: LoginInteractorParams {
    var authService: AuthService { AuthService(api: self.provider.authApi) }
}

final class LoginBuilder: Builder<LoginDependency>, LoginBuildable {

    func build(withListener listener: LoginListener) -> LoginRouting {
        let component = LoginComponent(dependency: dependency)
        let interactor = LoginInteractor(with: component)
        interactor.listener = listener
        let viewController = LoginViewController()
        viewController.listener = interactor
        return LoginRouter(interactor: interactor, viewController: viewController)
    }
}
