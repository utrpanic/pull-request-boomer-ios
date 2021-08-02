import BoomerLib
import ModernRIBs

public protocol LoginApis {
    var gitHub: GitHubApiProtocol { get }
}

public protocol LoginDependency: Dependency {
    var loginApis: LoginApis { get }
}

private final class LoginComponent: Component<LoginDependency> {
    
}

extension LoginComponent: LoginInteractorParams {
    var gitHubService: GitHubService {
        return GitHubService(api: self.dependency.loginApis.gitHub)
    }
}

public protocol LoginBuildable: Buildable {
    func build(withListener listener: LoginListener) -> ViewableRouting
}

public final class LoginBuilder: Builder<LoginDependency>, LoginBuildable {

    public func build(withListener listener: LoginListener) -> ViewableRouting {
        let component = LoginComponent(dependency: self.dependency)
        let interactor = LoginInteractor(with: component)
        interactor.listener = listener
        let viewController = LoginViewController()
        viewController.listener = interactor
        return LoginRouter(interactor: interactor, viewController: viewController)
    }
}
