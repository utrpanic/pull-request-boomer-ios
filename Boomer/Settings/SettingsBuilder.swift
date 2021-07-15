import BoomerLib
import ModernRIBs

extension RibletName {
    static var settings: String { #function }
}

protocol SettingsDependency: Dependency {
    var buildableFactory: BuildableFactoryProtocol { get }
}

final class SettingsComponent: Component<SettingsDependency> {

}

protocol SettingsBuildable: Buildable {
    func build(withListener listener: SettingsListener) -> SettingsRouting
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
