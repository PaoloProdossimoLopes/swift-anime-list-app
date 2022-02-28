//
//  AppCoordinator.swift
//  AnimeListApp
//
//  Created by Paolo Prodossimo Lopes on 27/02/22.
//

import UIKit

import ANLIB
import ANAuth

final class AppCoordinator: Coordinator {
    
    private let controller: UIViewController = .init()
    private lazy var navigation: UINavigationController = .init(rootViewController: controller)
    
    private var authModuleCoordinator: ANAuthCoordinator {
        let router = ModalNavigationRouter(parentViewController: navigation)
        router.typeOfModal = .fullScreen
        let coord = ANAuthCoordinator(router: router)
        return coord
    }
    
    override init(router: Router) {
        super.init(router: router)
    }
    
    override func start() {
        present(animated: true, onDismissed: { [weak self] in
            guard let self = self else { return }
            self.authModuleCoordinator.start()
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
