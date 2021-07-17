import InterfaceLib
import ModernRIBs

public protocol LoginInteractable: Interactable {
    var router: LoginRouting? { get set }
    var listener: LoginListener? { get set }
}

public protocol LoginViewControllable: ViewControllable {

}

final class LoginRouter: ViewableRouter<LoginInteractable, LoginViewControllable>, LoginRouting {

    override init(interactor: LoginInteractable, viewController: LoginViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
