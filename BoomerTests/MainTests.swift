import XCTest

import BoomerLib
import ModernRIBs

@testable import Boomer

final class MainDependencyMock: DependencyMock, MainDependency {
    
}

final class MainTests: XCTestCase {
    
    var common: CommonDependency!
    var router: MainRouter!
    var interactor: MainInteractor!

    override func setUpWithError() throws {
        let dependency = MainDependencyMock()
        let builder = MainBuilder(dependency: dependency)
        let (router, interactor) = builder.build()
        self.common = dependency.common
        self.router = router as? MainRouter
        self.interactor = interactor as? MainInteractor
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLaunchLoggedIn() throws {
        // Arrange
        self.common.gitHubApi.loggedIn = { true }
        // Act
        self.router.launch(from: UIWindow())
        // Assert
        XCTAssertEqual(
            Riblet(self.router),
            Riblet(
                MainRouter.self, [
                    Riblet(HomeRouter.self),
                    Riblet(SettingsRouter.self)
                ]
            )
        )
    }
    
    func testLaunchLoggedOut() throws {
        // Arrange
        self.common.gitHubApi.loggedIn = { false }
        // Act
        self.router.launch(from: UIWindow())
        // Assert
        XCTAssertEqual(
            Riblet(self.router),
            Riblet(
                MainRouter.self, [
                    Riblet(LoginRouter.self)
                ]
            )
        )
    }
}
