import InterfaceLib
import ModelLib
import ModernRIBs

final class BuildableProvider: BuildableProviderProtocol, MainDependency {
    
    var theWorld: World
    var buildables: BuildableProviderProtocol { self }
    var rootBuildable: MainBuildable { MainBuilder(dependency: self, in: self.theWorld) }
    
    subscript<T>(type: T.Type, dependency dependency: Dependency) -> T {
        let buildable: Buildable
        switch dependency {
        case let dependency as LoginDependency where type.self == LoginBuildable.self:
            buildable = LoginBuilder(dependency: dependency, in: self.theWorld)
        case let dependency as HomeDependency where type.self == HomeBuildable.self:
            buildable = HomeBuilder(dependency: dependency, in: self.theWorld)
        case let dependency as SettingsDependency where type.self == SettingsBuildable.self:
            buildable = SettingsBuilder(dependency: dependency, in: self.theWorld)
        default:
            fatalError()
        }
        return buildable as! T
    }
    
    init(in world: World) {
        self.theWorld = world
    }
}

final class AppWorld: World {
    var gitHubApi: GitHubApiProtocol = GitHubApi()
}
