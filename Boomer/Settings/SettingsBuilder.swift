import InterfaceLib
import ModelLib
import ModernRIBs

protocol SettingsDependency: Dependency {
    
}

final class SettingsComponent: Component<SettingsDependency> {
    
}

protocol SettingsBuildable: Buildable {
    func build(withListener listener: SettingsListener) -> ViewableRouting
}

final class SettingsBuilder: BuilderInTheWorld<SettingsDependency>, SettingsBuildable {
    
    var interactorParams: SettingsInteractor.Params {
        SettingsInteractor.Params(
            gitHubService: GitHubService(api: self.theWorld.gitHubApi)
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
