import XCTest

import ModelLib
import ModernRIBs
import InterfaceLib

@testable import Boomer

final class SettingsParentInteractorMock: SettingsListener {
    
}

final class SettingsDependencyMock: DependencyMock, SettingsDependency {

}

final class SettingsTests: XCTestCase {
    
    var router: SettingsRouter!
    var interactor: SettingsInteractor!

    override func setUpWithError() throws {
        let dependency = SettingsDependencyMock()
        let builder = SettingsBuilder(dependency: dependency, in: dependency.world)
        self.router = builder.build(withListener: SettingsParentInteractorMock()) as? SettingsRouter
        self.interactor = self.router.interactor as? SettingsInteractor
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
    }
}
