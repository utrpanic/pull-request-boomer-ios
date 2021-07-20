import ModelLib
import ModernRIBs
import InterfaceLib

@testable import Boomer

final class TestWorld: World {
    var authApi: AuthApiProtocol = AuthApiMock()
}

open class DependencyMock {
    var world: World = TestWorld()
    lazy var buildables: BuildableProviderProtocol = BuildableProvider(in: self.world)
}

final class AuthApiMock: AuthApiProtocol {
    
    var authToken: String? = nil
    
    func login() {
        fatalError()
    }
}
