import ModelLib
import ModernRIBs
import InterfaceLib

@testable import Boomer

final class TestWorld: World {
    var gitHubApi: GitHubApiProtocol = GitHubApiMock()
}

open class DependencyMock {
    var world: World = TestWorld()
    lazy var buildables: BuildableProviderProtocol = BuildableProvider(in: self.world)
}

final class GitHubApiMock: GitHubApiProtocol {
    
    var authToken: String? = nil
    
    func login() {
        fatalError()
    }
}
