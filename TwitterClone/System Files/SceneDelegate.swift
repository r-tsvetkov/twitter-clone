//
//  SceneDelegate.swift
//  TwitterClone
//
//  Created by Роман Цветков on 17.05.2020.
//  Copyright © 2020 Roman Tsvetkov. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: scene)
        window?.rootViewController = MainTabController() // UINavigationController(rootViewController: LoginController())
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {

        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

