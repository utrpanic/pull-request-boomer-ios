import BoomerLib
import ModernRIBs

protocol LoginDependency: Dependency {
    var common: CommonDependency { get }
}

private final class LoginComponent: Component<LoginDependency> {
    
}

extension LoginComponent: LoginInteractorParams {
    var gitHubService: GitHubService {
        return GitHubService(api: self.dependency.common.gitHubApi)
    }
}

protocol LoginBuildable: Buildable {
    func build(withListener listener: LoginListener) -> ViewableRouting
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
