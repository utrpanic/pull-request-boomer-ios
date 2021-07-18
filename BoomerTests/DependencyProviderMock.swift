import ModelLib
import ModernRIBs
import InterfaceLib

class DependencyMock: HasDependencyProvider {
    let apis: ApiProviderProtocol = ApiProviderMock()
    let buildables: BuildableProviderProtocol = BuildableProviderMock()
}

final class ApiProviderMock: ApiProviderProtocol {
    let auth: AuthApiProtocol = AuthApiMock()
}

final class BuildableProviderMock: BuildableProviderProtocol {
    
    subscript<T>(type: T.Type, dependency dependency: Dependency) -> T {
        let buildable: Buildable
        switch String(describing: type) {
        case String(describing: LoginBuildable.self):
            buildable = LoginBuilderMock()
        case String(describing: PullRequestsBuildable.self):
            buildable = PullRequestsBuilderMock()
        case String(describing: SettingsBuildable.self):
            buildable = SettingsBuilderMock()
        default:
            fatalError()
        }
        return buildable as! T
    }
}

final class AuthApiMock: AuthApiProtocol {
    
    var authToken: String? = nil
    
    func login() {
        fatalError()
    }
}
