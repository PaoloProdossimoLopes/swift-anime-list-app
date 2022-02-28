//
//  AppCoordinator.swift
//  AnimeListApp
//
//  Created by Paolo Prodossimo Lopes on 27/02/22.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private let controller: UIViewController = .init()
    private lazy var navigation: UINavigationController = .init(rootViewController: controller)
    
    override init(router: Router) {
        super.init(router: router)
    }
    
    override func start() {
        present(animated: true, onDismissed: nil)
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
