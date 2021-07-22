import ModernRIBs

protocol SettingsInteractable: Interactable {
    var router: SettingsRouting? { get set }
    var listener: SettingsListener? { get set }
}

protocol SettingsViewControllable: ViewControllable {
    
}

final class SettingsRouter: ViewableRouter<SettingsInteractable, SettingsViewControllable>, SettingsRouting {

    override init(interactor: SettingsInteractable, viewController: SettingsViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
