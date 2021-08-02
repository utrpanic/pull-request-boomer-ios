import UIKit

import CommonLib
import LoginRibs
import ModernRIBs

protocol MainInteractable: Interactable,
                           LoginListener,
                           HomeListener,
                           SettingsListener {
    var router: MainRouting? { get set }
    var listener: MainListener? { get set }
}

protocol MainViewControllable: ViewControllable {
    func showLaunchView()
    func hideLaunchView()
    func setTabs(_ tabs: [ViewControllable])
}

protocol MainRouterParams {
    var loginBuilder: LoginBuildable { get }
    var homeBuilder: HomeBuildable { get }
    var settingsBuilder: SettingsBuildable { get }
}

final class MainRouter: LaunchRouter<MainInteractable, MainViewControllable>, MainRouting {
    
    private let loginBuilder: LoginBuildable
    private let homeBuilder: HomeBuildable
    private let settingsBuilder: SettingsBuildable
    
    init(interactor: MainInteractable, viewController: MainViewControllable, params: MainRouterParams) {
        self.loginBuilder = params.loginBuilder
        self.homeBuilder = params.homeBuilder
        self.settingsBuilder = params.settingsBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    // MARK: - MainRouting
    
    func attachLogin() {
        let login = self.loginBuilder.build(withListener: self.interactor)
        self.attachChild(login)
        let current = self.viewController
        let child = login.viewControllable
        current.hideLaunchView()
        current.presentViewControllable(child, animated: true, style: .fullScreen, completion: nil)
    }
    
    func detachLogin() {
        guard let login = self.lastChild(typeOf: LoginRouting.self) else { return }
        self.detachChild(login)
        let current = self.viewControllable
        let child = login.viewControllable
        current.dismissViewControllable(child, animated: true, completion: nil)
    }
    
    func setMainTabs() {
        let pullRequest = self.homeBuilder.build(withListener: self.interactor)
        self.attachChild(pullRequest)
        let settings = self.settingsBuilder.build(withListener: self.interactor)
        self.attachChild(settings)
        let current = self.viewController
        let tabs = [pullRequest, settings].map { $0.viewControllable }
        current.setTabs(tabs)
        current.hideLaunchView()
    }
}
