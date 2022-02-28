//
//  AppDelegate.swift
//  ANAuth
//
//  Created by PaoloProdossimoLopes on 02/28/2022.
//  Copyright (c) 2022 PaoloProdossimoLopes. All rights reserved.
//

import UIKit
import ANLIB

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var coordinator: AppCoordinator!
    private var router: AppRouter!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { return false }
        
        router = .init(window: window)
        coordinator = .init(router: router)
        coordinator.start()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) { /*...*/ }

    func applicationDidEnterBackground(_ application: UIApplication) { /*...*/ }

    func applicationWillEnterForeground(_ application: UIApplication) { /*...*/ }

    func applicationDidBecomeActive(_ application: UIApplication) { /*...*/ }

    func applicationWillTerminate(_ application: UIApplication) { /*...*/ }
}

