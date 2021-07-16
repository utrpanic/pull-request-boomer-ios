import InterfaceLib
import ModernRIBs

final class SettingsComponent: Component<SettingsDependency> {
    
}

final class SettingsBuilder: Builder<SettingsDependency>, SettingsBuildable {

    func build(withListener listener: SettingsListener) -> SettingsRouting {
        let interactor = SettingsInteractor()
        interactor.listener = listener
        let viewController = SettingsViewController()
        _ = SettingsComponent(dependency: dependency)
        return SettingsRouter(interactor: interactor, viewController: viewController)
    }
}
