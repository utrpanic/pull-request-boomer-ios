import BoomerLib
import ModernRIBs

extension RibletName {
    static var login: String { #function }
}

protocol LoginDependency: Dependency {
    var buildableFactory: BuildableFactoryProtocol { get }
}

final class LoginComponent: Component<LoginDependency> {

}

protocol LoginBuildable: Buildable {
    func build(withListener listener: LoginListener) -> LoginRouting
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
