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

final class MainRouter: LaunchRouter<MainInteractable, MainViewControllable>, MainRouting {
    
    private let loginBuilder: LoginBuildable
    private let pullRequestBuilder: PullRequestsBuildable
    private let settingsBuilder: SettingsBuildable

    init(interactor: MainInteractable, viewController: MainViewControllable, loginBuilder: LoginBuildable, pullRequestsBuilder: PullRequestsBuildable, settingsBuilder: SettingsBuildable) {
        self.loginBuilder = loginBuilder
        self.pullRequestBuilder = pullRequestsBuilder
        self.settingsBuilder = settingsBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        let pullRequest = self.pullRequestBuilder.build(withListener: self.interactor)
        self.attachChild(pullRequest)
        let settings = self.settingsBuilder.build(withListener: self.interactor)
        self.attachChild(settings)
        let tabs = [pullRequest, settings].map { $0.viewControllable}
        self.viewController.setTabs(tabs)
    }
    
    // MARK: - MainRouting
    func routeToLogin() {
        let login = self.loginBuilder.build(withListener: self.interactor)
        self.attachChild(login)
        let current = self.viewControllable
        let child = login.viewControllable
        current.presentFullScreen(child, animated: true, completion: nil)
    }
}
