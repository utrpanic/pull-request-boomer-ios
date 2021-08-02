import BoomerLib
import ModernRIBs

protocol SettingsDependency: Dependency {
    var apis: AppApis { get }
}

private final class SettingsComponent: Component<SettingsDependency> {
    
}

extension SettingsComponent: SettingsInteractorParams {
    var gitHubService: GitHubService {
        return GitHubService(api: self.dependency.apis.gitHub)
    }
}

protocol SettingsBuildable: Buildable {
    func build(withListener listener: SettingsListener) -> ViewableRouting
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
