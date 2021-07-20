import InterfaceLib
import ModelLib
import ModernRIBs

final class AppWorld: World {
    var authApi: AuthApiProtocol = AuthApi()
}

final class BuildableProvider: BuildableProviderProtocol {
    
    private var world: World
    
    subscript<T>(type: T.Type, dependency dependency: Dependency) -> T {
        let buildable: Buildable
        switch dependency {
        case let dependency as LoginDependency where type.self == LoginBuildable.self:
            buildable = LoginBuilder(dependency: dependency, in: self.world)
        case let dependency as PullRequestsDependency where type.self == PullRequestsBuildable.self:
            buildable = PullRequestsBuilder(dependency: dependency, in: self.world)
        case let dependency as SettingsDependency where type.self == SettingsBuildable.self:
            buildable = SettingsBuilder(dependency: dependency, in: self.world)
        default:
            fatalError()
        }
        return buildable as! T
    }
    
    init(in world: World) {
        self.world = world
    }
}
