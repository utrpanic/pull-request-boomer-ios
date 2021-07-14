import ModernRIBs

protocol SettingsDependency: Dependency {

}

final class SettingsComponent: Component<SettingsDependency> {

}

protocol SettingsBuildable: Buildable {
    func build(withListener listener: SettingsListener) -> SettingsRouting
}

final class SettingsBuilder: Builder<SettingsDependency>, SettingsBuildable {

    override init(dependency: SettingsDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SettingsListener) -> SettingsRouting {
        let interactor = SettingsInteractor()
        interactor.listener = listener
        let viewController = SettingsViewController()
        _ = SettingsComponent(dependency: dependency)
        return SettingsRouter(interactor: interactor, viewController: viewController)
    }
}
