import ModelLib
import ModernRIBs

protocol SettingsRouting: ViewableRouting {
    
}

protocol SettingsListener: AnyObject {
    
}

final class SettingsInteractor: Interactor, SettingsInteractable, SettingsViewListener {
    
    weak var router: SettingsRouting?
    weak var listener: SettingsListener?
    
    struct Params {
        var gitHubService: GitHubService
    }
    
    var gitHubService: GitHubService
    
    init(params: Params) {
        self.gitHubService = params.gitHubService
    }
    
    // MARK: - SettingsViewListener
    
    func settingsViewLogOutTapped() {
        self.gitHubService.logout()
    }
}
