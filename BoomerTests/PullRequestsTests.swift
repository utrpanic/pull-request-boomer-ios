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
    
    func build(withListener listener: PullRequestsListener) -> ViewableRouting {
        let component = PullRequestsComponent(dependency: PullRequestsDependencyMock())
        let interactor = PullRequestsInteractor(params: component)
        interactor.listener = listener
        let viewController = PullRequestsViewController()
        viewController.listener = interactor
        return PullRequestsRouter(interactor: interactor, viewController: viewController)
    }
}

final class PullRequestsTests: XCTestCase {
    
    var parentInteractor: PullRequestsParentInteractorMock!
    var builder: PullRequestsBuilderMock!
    var router: PullRequestsRouter!
    var interactor: PullRequestsInteractor!

    override func setUpWithError() throws {
        self.parentInteractor = PullRequestsParentInteractorMock()
        self.builder = PullRequestsBuilderMock()
        self.router = builder.build(withListener: self.parentInteractor) as? PullRequestsRouter
        self.interactor = router.interactor as? PullRequestsInteractor
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {

    }
}
