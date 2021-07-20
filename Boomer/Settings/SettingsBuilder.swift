import InterfaceLib
import ModelLib
import ModernRIBs

public protocol SettingsDependency: Dependency {
    
}

final class SettingsComponent: ComponentInThisWorld<SettingsDependency> {
    
}

extension SettingsComponent: SettingsInteractorParams {
    var authService: AuthService { AuthService(api: self.world.authApi) }
}

final class SettingsBuilder: BuilderInThisWorld<SettingsDependency>, SettingsBuildable {

    func build(withListener listener: SettingsListener) -> ViewableRouting {
        let component = SettingsComponent(dependency: self.dependency, in: self.world)
        let interactor = SettingsInteractor(params: component)
        interactor.listener = listener
        let viewController = SettingsViewController()
        viewController.listener = interactor
        return SettingsRouter(interactor: interactor, viewController: viewController)
    }
}
