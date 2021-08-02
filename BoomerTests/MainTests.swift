import XCTest

import BoomerLib
import BoomerTestHelperLib
import ModernRIBs

@testable import LoginRibs
@testable import Boomer

open class DependencyMock {
    var apis: AppApis = AppApis(
        gitHub: GitHubApiMock()
    )
}

final class MainDependencyMock: DependencyMock, MainDependency {
    
}

final class MainTests: XCTestCase {
    
    var apis: AppApis!
    var router: MainRouter!
    var interactor: MainInteractor!

    override func setUpWithError() throws {
        let dependency = MainDependencyMock()
        let builder = MainBuilder(dependency: dependency)
        let (router, interactor) = builder.build()
        self.apis = dependency.apis
        self.router = router as? MainRouter
        self.interactor = interactor as? MainInteractor
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLaunchLoggedIn() throws {
        // Arrange
        self.apis.gitHub.loggedIn = { true }
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
        self.apis.gitHub.loggedIn = { false }
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
