import XCTest

import ModelLib
import ModernRIBs
import InterfaceLib

@testable import Boomer

final class LoginParentInteractorMock: LoginListener {

}

final class LoginDependencyMock: DependencyMock, LoginDependency {
    
}

final class LoginTests: XCTestCase {
    
    var router: LoginRouter!
    var interactor: LoginInteractor!

    override func setUpWithError() throws {
        let dependency = LoginDependencyMock()
        let builder = LoginBuilder(dependency: dependency, in: dependency.world)
        self.router = builder.build(withListener: LoginParentInteractorMock()) as? LoginRouter
        self.interactor = router.interactor as? LoginInteractor
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
    }
}
