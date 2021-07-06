import ModernRIBs

protocol SettingsRouting: ViewableRouting {
    
}

protocol SettingsPresentable: Presentable {
    var listener: SettingsPresentableListener? { get set }
}

protocol SettingsListener: AnyObject {
    
}

final class SettingsInteractor: PresentableInteractor<SettingsPresentable>, SettingsInteractable, SettingsPresentableListener {

    weak var router: SettingsRouting?
    weak var listener: SettingsListener?

    override init(presenter: SettingsPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }
}
