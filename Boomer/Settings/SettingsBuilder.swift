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
        _ = SettingsComponent(dependency: dependency)
        let viewController = SettingsViewController()
        let interactor = SettingsInteractor(presenter: viewController)
        interactor.listener = listener
        return SettingsRouter(interactor: interactor, viewController: viewController)
    }
}
