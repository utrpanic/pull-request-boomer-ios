import InterfaceLib
import ModelLib
import ModernRIBs

protocol SettingsDependency: Dependency {
    
}

final class SettingsComponent: ComponentInThisWorld<SettingsDependency> {
    
}

extension SettingsComponent: SettingsInteractorParams {
    var gitHubService: GitHubService { GitHubService(api: self.world.gitHubApi) }
}

protocol SettingsBuildable: Buildable {
    func build(withListener listener: SettingsListener) -> ViewableRouting
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
