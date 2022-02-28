//
//  AppRouter.swift
//  AdvancedCoordinator
//
//  Created by Paolo Prodossimo Lopes on 27/02/22.
//

import UIKit

open class AppRouter: Router {
    
    let window: UIWindow
    
    public init(window: UIWindow) {
        self.window = window
    }
    
    public func present(_ viewController: UIViewController, animated: Bool, onDismissed: (() -> Void)?) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        //Don't use animate
        DispatchQueue.main.async {
            onDismissed?()
        }
        
    }
    
    public func dismiss(animated: Bool, onDismissed: (() -> Void)?) { /*Don't need this */ }
}
