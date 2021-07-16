import XCTest

import ModelLib
import ModernRIBs
import InterfaceLib

@testable import Boomer

class LoginParentInteractorMock: LoginListener {

}

class LoginDependencyMock: LoginDependency {
    var provider: CommonDependencyProviderProtocol { CommonDependencyProviderMock() }
}

class LoginBuilderMock: LoginBuildable {
    
    func build(withListener listener: LoginListener) -> LoginRouting {
        let component = LoginComponent(dependency: LoginDependencyMock())
        let interactor = LoginInteractor(with: component)
        interactor.listener = listener
        let viewController = LoginViewController()
        return LoginRouter(interactor: interactor, viewController: viewController)
    }
}

class LoginTests: XCTestCase {
    
    var router: LoginRouter!
    var interactor: LoginInteractor!

    override func setUpWithError() throws {
        let builder = LoginBuilderMock()
        self.router = builder.build(withListener: LoginParentInteractorMock()) as? LoginRouter
        self.interactor = router.interactor as? LoginInteractor
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
    }
}
