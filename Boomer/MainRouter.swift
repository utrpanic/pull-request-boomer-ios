import UIKit

import ModernRIBs

protocol MainInteractable: Interactable,
                           LoginListener,
                           PullRequestsListener,
                           SettingsListener {
    var router: MainRouting? { get set }
    var listener: MainListener? { get set }
}

protocol MainViewControllable: ViewControllable {
    func setTabs(_ tabs: [ViewControllable])
}

protocol MainRouterDependency {
    var loginBuilder: LoginBuildable { get }
    var pullRequestBuilder: PullRequestsBuildable { get }
    var settingsBuilder: SettingsBuildable { get }
}

final class MainRouter: LaunchRouter<MainInteractable, MainViewControllable>, MainRouting {
    
    let dependency: MainRouterDependency

    init(interactor: MainInteractable, viewController: MainViewControllable, dependency: MainRouterDependency) {
        self.dependency = dependency
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        let pullRequest = self.dependency.pullRequestBuilder.build(withListener: self.interactor)
        self.attachChild(pullRequest)
        let settings = self.dependency.settingsBuilder.build(withListener: self.interactor)
        self.attachChild(settings)
        let tabs = [pullRequest, settings].map { $0.viewControllable}
        self.viewController.setTabs(tabs)
    }
    
    // MARK: - MainRouting
    
    func attachLogin() {
        let login = self.dependency.loginBuilder.build(withListener: self.interactor)
        self.attachChild(login)
        let current = self.viewControllable
        let child = login.viewControllable
        current.presentViewControllable(child, animated: true, style: .fullScreen, completion: nil)
    }
    
    func detachLogin() {
        guard let login = self.lastChild(typeOf: LoginRouting.self) else { return }
        self.detachChild(login)
        let current = self.viewControllable
        let child = login.viewControllable
        current.dismissViewControllable(child, animated: true, completion: nil)
    }
}
