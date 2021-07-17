import XCTest

import ModelLib
import ModernRIBs
import InterfaceLib

@testable import Boomer

final class PullRequestsParentInteractorMock: PullRequestsListener {
    
}

final class PullRequestsDependencyMock: DependencyMock, PullRequestsDependency {
    
}

final class PullRequestsBuilderMock: PullRequestsBuildable {
    
    func build(withListener listener: PullRequestsListener) -> PullRequestsRouting {
        _ = PullRequestsComponent(dependency: PullRequestsDependencyMock())
        let interactor = PullRequestsInteractor()
        interactor.listener = listener
        let viewController = PullRequestsViewController()
        return PullRequestsRouter(interactor: interactor, viewController: viewController)
    }
}

final class PullRequestsTests: XCTestCase {
    
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
