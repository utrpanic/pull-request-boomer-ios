import InterfaceLib
import ModelLib
import ModernRIBs

final class SettingsComponent: Component<SettingsDependency> {
    
}

extension SettingsComponent: SettingsInteractorParams {
    var authService: AuthService { AuthService(api: self.apis.auth) }
}

final class SettingsBuilder: Builder<SettingsDependency>, SettingsBuildable {

    func build(withListener listener: SettingsListener) -> ViewableRouting {
        let component = SettingsComponent(dependency: self.dependency)
        let interactor = SettingsInteractor(params: component)
        interactor.listener = listener
        let viewController = SettingsViewController()
        viewController.listener = interactor
        return SettingsRouter(interactor: interactor, viewController: viewController)
    }
}
