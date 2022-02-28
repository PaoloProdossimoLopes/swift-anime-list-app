//
//  AppRouter.swift
//  AdvancedCoordinator
//
//  Created by Paolo Prodossimo Lopes on 27/02/22.
//

import UIKit

final class AppRouter: Router {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func present(_ viewController: UIViewController, animated: Bool, onDismissed: (() -> Void)?) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        //Don't use animate
        onDismissed?()
    }
    
    func dismiss(animated: Bool, onDismissed: (() -> Void)?) { /*Don't need this */ }
}
