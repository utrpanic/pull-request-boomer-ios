import ModernRIBs

protocol SettingsRouting: ViewableRouting {
    
}

protocol SettingsListener: AnyObject {
    
}

final class SettingsInteractor: Interactor, SettingsInteractable, SettingsPresentableListener {
    weak var router: SettingsRouting?
    weak var listener: SettingsListener?
}
