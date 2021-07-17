import InterfaceLib
import ModernRIBs

final class SettingsComponent: Component<SettingsDependency> {
    
}

final class SettingsBuilder: Builder<SettingsDependency>, SettingsBuildable {

    func build(withListener listener: SettingsListener) -> SettingsRouting {
        _ = SettingsComponent(dependency: dependency)
        let interactor = SettingsInteractor()
        interactor.listener = listener
        let viewController = SettingsViewController()
        return SettingsRouter(interactor: interactor, viewController: viewController)
    }
}
