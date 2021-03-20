//
//  SceneDelegate.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/20/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            
            let navigationController = UINavigationController()
            let coordinator = MainCoordinator(navigationController: navigationController)
            
            window.rootViewController = coordinator.navigationController
            coordinator.start()

            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

