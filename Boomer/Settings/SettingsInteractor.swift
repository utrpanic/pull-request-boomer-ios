import ModelLib
import ModernRIBs

protocol SettingsRouting: ViewableRouting {
    
}

protocol SettingsListener: AnyObject {
    
}

protocol SettingsInteractorParams {
    var authService: AuthService { get }
}

final class SettingsInteractor: Interactor, SettingsInteractable, SettingsViewListener {
    
    weak var router: SettingsRouting?
    weak var listener: SettingsListener?
    
    var authService: AuthService
    
    init(params: SettingsInteractorParams) {
        self.authService = params.authService
    }
    
    // MARK: - SettingsViewListener
    
    func settingsViewLogOutTapped() {
        self.authService.logout()
    }
}
