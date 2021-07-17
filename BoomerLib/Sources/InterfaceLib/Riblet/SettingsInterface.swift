import ModernRIBs

public protocol SettingsDependency: Dependency, HasDependencyProvider {
    
}

public protocol SettingsBuildable: Buildable {
    func build(withListener listener: SettingsListener) -> ViewableRouting
}

public protocol SettingsListener: AnyObject {
    
}
