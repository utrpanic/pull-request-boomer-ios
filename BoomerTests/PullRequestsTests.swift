import XCTest

import ModelLib
import ModernRIBs
import InterfaceLib

@testable import Boomer

class PullRequestsParentInteractorMock: PullRequestsListener {
    
}

class PullRequestsDependencyMock: PullRequestsDependency {
    var provider: CommonDependencyProviderProtocol { CommonDependencyProviderMock() }
}

class PullRequestsBuilderMock: PullRequestsBuildable {
    
    func build(withListener listener: PullRequestsListener) -> PullRequestsRouting {
        let interactor = PullRequestsInteractor()
        interactor.listener = listener
        let viewController = PullRequestsViewController()
        _ = PullRequestsComponent(dependency: PullRequestsDependencyMock())
        return PullRequestsRouter(interactor: interactor, viewController: viewController)
    }
}

class PullRequestsTests: XCTestCase {
    
    var router: PullRequestsRouter!
    var interactor: PullRequestsInteractor!

    override func setUpWithError() throws {
        let builder = PullRequestsBuilderMock()
        self.router = builder.build(withListener: PullRequestsParentInteractorMock()) as? PullRequestsRouter
        self.interactor = router.interactor as? PullRequestsInteractor
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {

    }
}
