import InterfaceLib
import ModernRIBs
import ModelLib

public protocol SettingsRouting: ViewableRouting {
    
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
