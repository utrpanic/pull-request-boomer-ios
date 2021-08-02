import XCTest

import BoomerLib
import BoomerTestHelperLib
import ModernRIBs

@testable import LoginRibs

final class LoginParentInteractorMock: LoginListener {

}

final class LoginApisMock: LoginApis {
    var gitHub: GitHubApiProtocol = GitHubApiMock()
}

final class LoginDependencyMock: LoginDependency {
    var loginApis: LoginApis { LoginApisMock() }
}

final class LoginTests: XCTestCase {
    
    var parentInteractor: LoginParentInteractorMock!
    var router: LoginRouter!
    var interactor: LoginInteractor!

    override func setUpWithError() throws {
        let dependency = LoginDependencyMock()
        let builder = LoginBuilder(dependency: dependency)
        self.parentInteractor = LoginParentInteractorMock()
        self.router = builder.build(withListener: self.parentInteractor) as? LoginRouter
        self.interactor = router.interactor as? LoginInteractor
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
    }
}
