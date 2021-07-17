import InterfaceLib
import ModelLib
import ModernRIBs

final class ApiProvider: ApiProviderProtocol {
    let auth: AuthApiProtocol = AuthApi()
}

final class BuildableProvider: BuildableProviderProtocol {
    
    subscript<T>(type: T.Type, dependency dependency: Dependency) -> T {
        let buildable: Buildable
        switch dependency {
        case let dependency as LoginDependency where type.self == LoginBuildable.self:
            buildable = LoginBuilder(dependency: dependency)
        case let dependency as PullRequestsDependency where type.self == PullRequestsBuildable.self:
            buildable = PullRequestsBuilder(dependency: dependency)
        case let dependency as SettingsDependency where type.self == SettingsBuildable.self:
            buildable = SettingsBuilder(dependency: dependency)
        default:
            fatalError()
        }
        return buildable as! T
    }
}
