import InterfaceLib
import ModelLib
import ModernRIBs

protocol LoginDependency: Dependency {
    
}

final class LoginComponent: ComponentInThisWorld<LoginDependency> {
    
}

extension LoginComponent: LoginInteractorParams {
    var authService: AuthService { AuthService(api: self.world.authApi) }
}

protocol LoginBuildable: Buildable {
    func build(withListener listener: LoginListener) -> ViewableRouting
}

final class LoginBuilder: BuilderInThisWorld<LoginDependency>, LoginBuildable {

    func build(withListener listener: LoginListener) -> ViewableRouting {
        let component = LoginComponent(dependency: self.dependency, in: self.world)
        let interactor = LoginInteractor(with: component)
        interactor.listener = listener
        let viewController = LoginViewController()
        viewController.listener = interactor
        return LoginRouter(interactor: interactor, viewController: viewController)
    }
}
