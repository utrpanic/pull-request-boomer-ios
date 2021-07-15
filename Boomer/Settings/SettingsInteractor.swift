import InterfaceLib
import ModernRIBs

final class SettingsInteractor: Interactor, SettingsInteractable, SettingsViewListener {
    weak var router: SettingsRouting?
    weak var listener: SettingsListener?
}
