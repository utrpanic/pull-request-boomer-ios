import CommonLib
import ModelLib
import ModernRIBs

protocol SettingsDependency: Dependency {
    
}

private final class SettingsComponent: Component<SettingsDependency> {
    
}

protocol SettingsBuildable: Buildable {
    func build(withListener listener: SettingsListener) -> ViewableRouting
}

final class SettingsBuilder: BuilderWithTargetDependency<SettingsDependency>, SettingsBuildable {
    
    private var interactorParams: SettingsInteractor.Params {
        SettingsInteractor.Params(
            gitHubService: GitHubService(api: self.targetDependency.gitHubApi)
        )
    }

    func build(withListener listener: SettingsListener) -> ViewableRouting {
        _ = SettingsComponent(dependency: self.dependency)
        let interactor = SettingsInteractor(params: self.interactorParams)
        interactor.listener = listener
        let viewController = SettingsViewController()
        viewController.listener = interactor
        return SettingsRouter(interactor: interactor, viewController: viewController)
    }
}
