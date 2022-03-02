//
//  AppCoordinator.swift
//  AnimeListApp
//
//  Created by Paolo Prodossimo Lopes on 27/02/22.
//

import UIKit

import ANLIB
import ANAuth
import ANHome

final class AppCoordinator: Coordinator {
    
    private let controller: UIViewController = .init()
    private lazy var navigation: UINavigationController = .init(rootViewController: controller)
    
    private lazy var modalRouter: ModalNavigationRouter = {
        let router = ModalNavigationRouter(parentViewController: navigation)
        router.typeOfModal = .fullScreen
        return router
    }()
    
    private var authModuleCoordinator: ANAuthCoordinator?
    private var homeModuleCoordinator: HomeCoordinator?
    
    override func start() {
        authModuleCoordinator = ANAuthCoordinator(router: modalRouter)
        authModuleCoordinator?.delegate = self
        
        present(animated: true, onDismissed: { [weak self] in
            guard let self = self else { return }
            self.authModuleCoordinator?.start()
        })
    }
    
    override func present(animated: Bool, onDismissed: Coordinator.onDismissedCallback?) {
        viewFormatter(&navigation)
        router.present(navigation, animated: animated, onDismissed: onDismissed)
    }
    
    private func viewFormatter(_ nav: inout UINavigationController) {
        nav.navigationBar.isHidden = true
        nav.view.backgroundColor = .red
    }
}

extension AppCoordinator: ANAuthCoordinatorDelegate {
    func goToHome(_ controller: LoginViewController) {
        
        let modalRouter = ModalNavigationRouter(parentViewController: controller)
        homeModuleCoordinator = HomeCoordinator(router: modalRouter)
        homeModuleCoordinator?.start()
    }
}
