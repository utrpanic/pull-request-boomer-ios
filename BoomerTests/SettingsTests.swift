import XCTest

import ModelLib
import ModernRIBs
import InterfaceLib

@testable import Boomer

final class SettingsParentInteractorMock: SettingsListener {
    
}

final class SettingsDependencyMock: DependencyMock, SettingsDependency {

}

final class SettingsBuilderMock: SettingsBuildable {
    
    func build(withListener listener: SettingsListener) -> ViewableRouting {
        let component = SettingsComponent(dependency: SettingsDependencyMock())
        let interactor = SettingsInteractor(params: component)
        interactor.listener = listener
        let viewController = SettingsViewController()
        viewController.listener = interactor
        return SettingsRouter(interactor: interactor, viewController: viewController)
    }
}

final class SettingsTests: XCTestCase {

    var parentInteractor: SettingsParentInteractorMock!
    var builder: SettingsBuilderMock!
    var router: SettingsRouter!
    var interactor: SettingsInteractor!

    override func setUpWithError() throws {
        self.parentInteractor = SettingsParentInteractorMock()
        self.builder = SettingsBuilderMock()
        self.router = builder.build(withListener: self.parentInteractor) as? SettingsRouter
        self.interactor = self.router.interactor as? SettingsInteractor
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
    }
}
