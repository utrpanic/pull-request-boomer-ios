import XCTest

import ModelLib
import ModernRIBs
import InterfaceLib

@testable import Boomer

final class PullRequestsParentInteractorMock: PullRequestsListener {
    
}

final class PullRequestsDependencyMock: DependencyMock, PullRequestsDependency {
    
}

final class PullRequestsTests: XCTestCase {
    
    var parentInteractor: PullRequestsParentInteractorMock!
    var builder: PullRequestsBuilder!
    var router: PullRequestsRouter!
    var interactor: PullRequestsInteractor!

    override func setUpWithError() throws {
        let dependency = PullRequestsDependencyMock()
        self.builder = PullRequestsBuilder(dependency: dependency, in: dependency.world)
        self.parentInteractor = PullRequestsParentInteractorMock()
        self.router = builder.build(withListener: self.parentInteractor) as? PullRequestsRouter
        self.interactor = router.interactor as? PullRequestsInteractor
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {

    }
}
