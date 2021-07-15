import BoomerLib
import ModernRIBs

class BuildableFactory: BuildableFactoryProtocol {
    
    func create(ribletName: String, dependency: Dependency) -> Buildable {
        switch ribletName {
        case RibletName.login:
            guard let dependency = dependency as? LoginDependency else { break }
            return LoginBuilder(dependency: dependency)
        case RibletName.pullRequests:
            guard let dependency = dependency as? PullRequestsDependency else { break }
            return PullRequestsBuilder(dependency: dependency)
        case RibletName.settings:
            guard let dependency = dependency as? SettingsDependency else { break }
            return SettingsBuilder(dependency: dependency)
        default:
            break
        }
        fatalError()
    }
}
