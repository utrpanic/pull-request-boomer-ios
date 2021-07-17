import ModelLib
import ModernRIBs
import InterfaceLib

extension Component {
    
    var apis: ApiProviderProtocol {
        return self.shared { ApiProviderMock() }
    }
    var buildables: BuildableProviderProtocol {
        return self.shared { BuildableProviderMock() }
    }
}

struct ApiProviderMock: ApiProviderProtocol {
    var auth: AuthApiProtocol { AuthApi() }
}

struct BuildableProviderMock: BuildableProviderProtocol {
    
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

struct Riblet: Equatable {
    
    let root: String
    let children: [Riblet]
    
    init<T: Routing>(_ root: T.Type, _ children: [Riblet] = []) {
        self.root = String(describing: root)
        self.children = children
    }
    
    init(_ router: Routing) {
        self.root = String(describing: type(of: router))
        self.children = router.children.map { Riblet($0) }
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.root == rhs.root && lhs.children == rhs.children
    }
}
