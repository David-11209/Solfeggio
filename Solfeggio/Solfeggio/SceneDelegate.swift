//
//  SceneDelegate.swift
//  Solfeggio
//
//  Created by Давид Васильев on 13.03.2024.
//

import Swinject
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let container = Container()

    func scene(
        _ scene: UIScene, willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
            let assembly = ContainerAssembly()
            assembly.assemble(container: container)
            guard let windowScene = (scene as? UIWindowScene) else { return }
            self.window = UIWindow(windowScene: windowScene)
            guard let networkMonitor = container.resolve(
                NetworkMonitorProtocol.self
            ) else { return }
            networkMonitor.startMonitoring()
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) {_ in
                if networkMonitor.isConnected {
                    self.makeTabBarControllerVisible()
                } else {
                    guard let viewModel = self.container.resolve(
                        MissingInternetViewModelProtocol.self
                    ) else { return }
                    let viewController = MissingInternetViewController(viewModel: viewModel)
                    viewController.exitClosure = {
                        self.makeTabBarControllerVisible()
                    }
                    self.window?.rootViewController = viewController
                    self.window?.makeKeyAndVisible()
                }

            }
        }

    func makeTabBarControllerVisible() {
        let fabric = TabBarFabric(container: self.container)
        let tbController = fabric.makeTabBarController()
        self.window?.rootViewController = tbController
        self.window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not
        // necessarily discarded (see `application:didDiscardSceneSessions` instead).
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

        // Save changes in the application's managed object context when the application transitions to the background.
        //        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }

}
