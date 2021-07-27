import ModelLib
import ModernRIBs

protocol SettingsRouting: ViewableRouting {
    
}

protocol SettingsListener: AnyObject {
    
}

protocol SettingsInteractorParams {
    var gitHubService: GitHubService { get }
}

final class SettingsInteractor: Interactor, SettingsInteractable, SettingsViewListener {
    
    weak var router: SettingsRouting?
    weak var listener: SettingsListener?
    
    var gitHubService: GitHubService
    
    init(params: SettingsInteractorParams) {
        self.gitHubService = params.gitHubService
    }
    
    // MARK: - SettingsViewListener
    
    func settingsViewLogOutTapped() {
        self.gitHubService.logout()
    }
}
