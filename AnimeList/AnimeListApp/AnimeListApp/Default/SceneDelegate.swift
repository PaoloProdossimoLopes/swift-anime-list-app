//
//  SceneDelegate.swift
//  AnimeListApp
//
//  Created by Paolo Prodossimo Lopes on 27/02/22.
//

import UIKit
import ANLIB

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private var coordinator: AppCoordinator!
    private var router: AppRouter!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        if let window = window { startApplication(window) }
    }
    
    private func startApplication(_ window: UIWindow) {
        router = AppRouter(window: window)
        coordinator = AppCoordinator(router: router)
        coordinator.start()
    }

    func sceneDidDisconnect(_ scene: UIScene) { /*...*/ }

    func sceneDidBecomeActive(_ scene: UIScene) { /*...*/ }

    func sceneWillResignActive(_ scene: UIScene) { /*...*/ }

    func sceneWillEnterForeground(_ scene: UIScene) { /*...*/ }

    func sceneDidEnterBackground(_ scene: UIScene) { /*...*/ }
}

