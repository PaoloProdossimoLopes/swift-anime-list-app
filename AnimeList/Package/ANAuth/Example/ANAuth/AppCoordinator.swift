//
//  AppCoordinator.swift
//  ANAuth_Example
//
//  Created by Paolo Prodossimo Lopes on 28/02/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import ANLIB
import ANAuth

final class AppCoordinator: Coordinator {
    
    private let controller = UIViewController()
    private lazy var navigation = UINavigationController(rootViewController: controller)
    
    private lazy var authModuleCoordinator: ANAuthCoordinator = {
        let mRouter = ModalNavigationRouter(parentViewController: navigation)
        mRouter.typeOfModal = .fullScreen
        let coord = ANAuthCoordinator(self, router: mRouter)
        return coord
    }()
    
    override init(router: Router) {
        super.init(router: router)
    }
    
    override func start() {
        present(animated: true, onDismissed: nil)
    }
    
    override func present(animated: Bool, onDismissed: Coordinator.onDismissedCallback?) {
        viewFormatter(&navigation)
        router.present(navigation, animated: animated, onDismissed: { [weak self] in
            guard let self = self else { return }
            self.moduleStart()
        })
    }
    
    private func viewFormatter(_ nav: inout UINavigationController) {
        nav.navigationBar.isHidden = true
        nav.view.backgroundColor = .white
    }
    
    private func moduleStart() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.authModuleCoordinator.start()
        }
    }
}

extension AppCoordinator: ANAuthCoordinatorDelegate {
    func goToHome(_ controller: LoginViewController) {
        
    }
}
