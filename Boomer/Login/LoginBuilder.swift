import InterfaceLib
import ModelLib
import ModernRIBs

protocol LoginDependency: Dependency {
    
}

final class LoginComponent: Component<LoginDependency> {
    
}

protocol LoginBuildable: Buildable {
    func build(withListener listener: LoginListener) -> ViewableRouting
}

final class LoginBuilder: BuilderInTheWorld<LoginDependency>, LoginBuildable {
    
    var interactorParams: LoginInteractor.Params {
        return LoginInteractor.Params(
            gitHubService: GitHubService(api: self.theWorld.gitHubApi)
        )
    }

    func build(withListener listener: LoginListener) -> ViewableRouting {
        _ = LoginComponent(dependency: self.dependency)
        let interactor = LoginInteractor(with: self.interactorParams)
        interactor.listener = listener
        let viewController = LoginViewController()
        viewController.listener = interactor
        return LoginRouter(interactor: interactor, viewController: viewController)
    }
}
