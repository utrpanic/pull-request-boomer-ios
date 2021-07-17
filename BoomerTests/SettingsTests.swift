import XCTest

import ModelLib
import ModernRIBs
import InterfaceLib

@testable import Boomer

class SettingsParentInteractorMock: SettingsListener {
    
}

class SettingsDependencyMock: SettingsDependency {

}

class SettingsBuilderMock: SettingsBuildable {
    
    func build(withListener listener: SettingsListener) -> SettingsRouting {
        let interactor = SettingsInteractor()
        interactor.listener = listener
        let viewController = SettingsViewController()
        _ = SettingsComponent(dependency: SettingsDependencyMock())
        return SettingsRouter(interactor: interactor, viewController: viewController)
    }
}

class SettingsTests: XCTestCase {
    
    var router: SettingsRouter!
    var interactor: SettingsInteractor!

    override func setUpWithError() throws {
        let builder = SettingsBuilderMock()
        self.router = builder.build(withListener: SettingsParentInteractorMock()) as? SettingsRouter
        self.interactor = self.router.interactor as? SettingsInteractor
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
    }
}
