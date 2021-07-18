import ModernRIBs

public protocol SettingsBuildable: Buildable {
    func build(withListener listener: SettingsListener) -> ViewableRouting
}

public protocol SettingsListener: AnyObject {
    
}
