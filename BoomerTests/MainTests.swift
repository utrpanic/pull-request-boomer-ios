import XCTest

import ModelLib
import ModernRIBs
import InterfaceLib

@testable import Boomer

class MainDependencyMock: MainDependency {
    
    var provider: CommonDependencyProviderProtocol { CommonDependencyProviderMock() }
    
    var samIsLoggedIn: Bool = false
}

class MainBuilderMock: MainBuildable {
    
    func build() -> MainRouting {
        let component = MainComponent(dependency: MainDependencyMock())
        let interactor = MainInteractor(with: component)
        let viewController = MainViewController()
        return MainRouter(
            interactor: interactor,
            viewController: viewController,
            params: component
        )
    }
}

class MainTests: XCTestCase {
    
    var router: MainRouter!
    var interactor: MainInteractor!

    override func setUpWithError() throws {
        let builder = MainBuilderMock()
        self.router = builder.build() as? MainRouter
        self.interactor = router.interactor as? MainInteractor
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        self.router.load()
        
        XCTAssertEqual(
            Riblet(self.router),
            Riblet(
                MainRouter.self, [
                    Riblet(PullRequestsRouter.self),
                    Riblet(SettingsRouter.self)
                ]
            )
        )
        
        self.interactor.activate()

        XCTAssertEqual(
            Riblet(self.router),
            Riblet(
                MainRouter.self, [
                    Riblet(PullRequestsRouter.self),
                    Riblet(SettingsRouter.self),
                    Riblet(LoginRouter.self)
                ]
            )
        )
    }
}


