import SwiftUI

import InterfaceLib
import ModelLib
import ModernRIBs

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var launchRouter: LaunchRouting?
    var urlHandler: UrlHandler?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        self.setupAppearance()
        
        self.startApplication(with: scene)
    }
    
    private func setupAppearance() {
        UIView.appearance().tintColor = UIColor(named: "accent")
    }
    
    private func startApplication(with scene: UIScene) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let appComponent = AppComponent()
        let (launchRouter, urlHandler) = MainBuilder(dependency: appComponent, in: appComponent.world).build()
        let window = UIWindow(windowScene: windowScene)
        launchRouter.launch(from: window)
        self.launchRouter = launchRouter
        self.urlHandler = urlHandler
        self.window = window
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let context = URLContexts.first else {
            fatalError("Open url called without a context. This should never happen.")
        }
        self.urlHandler?.handle(context.url)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

protocol UrlHandler {
    func handle(_ url: URL)
}
