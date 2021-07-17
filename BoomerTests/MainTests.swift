import XCTest

import ModernRIBs
import InterfaceLib

@testable import Boomer
@testable import ModelLib

final class MainDependencyMock: DependencyMock, MainDependency {
    
}

final class MainBuilderMock: MainBuildable {
    
    func build() -> (LaunchRouting, UrlHandler) {
        let component = MainComponent(dependency: MainDependencyMock())
        let interactor = MainInteractor(params: component)
        let viewController = MainViewController()
        let router = MainRouter(
            interactor: interactor,
            viewController: viewController,
            params: component
        )
        return (router, interactor)
    }
}

final class MainTests: XCTestCase {
    
    var router: MainRouter!
    var interactor: MainInteractor!

    override func setUpWithError() throws {
        let builder = MainBuilderMock()
        let (router, interactor) = builder.build()
        self.router = router as? MainRouter
        self.interactor = interactor as? MainInteractor
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLaunchLoggedIn() throws {
        // Arrange
        self.interactor.authService.api.authToken = "SomeToken"
        // Act
        self.router.launch(from: UIWindow())
        // Assert
        XCTAssertEqual(
            Riblet(self.router),
            Riblet(
                MainRouter.self, [
                    Riblet(PullRequestsRouter.self),
                    Riblet(SettingsRouter.self)
                ]
            )
        )
    }
    
    func testLaunchLoggedOut() throws {
        // Arrange
        self.interactor.authService.api.authToken = nil
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
