import InterfaceLib
import ModelLib
import ModernRIBs

protocol LoginDependency: Dependency {
    
}

final class LoginComponent: ComponentInThisWorld<LoginDependency> {
    
}

extension LoginComponent: LoginInteractorParams {
    var gitHubService: GitHubService { GitHubService(api: self.world.gitHubApi) }
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
