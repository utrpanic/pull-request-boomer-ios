import XCTest

import ModelLib
import ModernRIBs
import InterfaceLib

@testable import Boomer

final class HomeParentInteractorMock: HomeListener {
    
}

final class HomeDependencyMock: DependencyMock, HomeDependency {
    
}

final class HomeTests: XCTestCase {
    
    var parentInteractor: HomeParentInteractorMock!
    var builder: HomeBuilder!
    var router: HomeRouter!
    var interactor: HomeInteractor!

    override func setUpWithError() throws {
        let dependency = HomeDependencyMock()
        self.builder = HomeBuilder(dependency: dependency, in: dependency.world)
        self.parentInteractor = HomeParentInteractorMock()
        self.router = builder.build(withListener: self.parentInteractor) as? HomeRouter
        self.interactor = router.interactor as? HomeInteractor
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {

    }
}
