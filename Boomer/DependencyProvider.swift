import InterfaceLib
import ModelLib
import ModernRIBs

extension Component {
    
    var apis: ApiProviderProtocol {
        return self.shared { ApiProvider() }
    }
    var buildables: BuildableProviderProtocol {
        return self.shared { BuildableProvider() }
    }
}

private struct ApiProvider: ApiProviderProtocol {
    let auth: AuthApiProtocol = AuthApi()
}

private struct BuildableProvider: BuildableProviderProtocol {
    
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
