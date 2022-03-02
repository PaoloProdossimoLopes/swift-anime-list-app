//
//  HomeCoordinator.swift
//  ANAuth
//
//  Created by Paolo Prodossimo Lopes on 01/03/22.
//

import UIKit

import ANLIB

public final class HomeCoordinator: Coordinator {
    
    private lazy var controller: UIViewController = .init()
    
    public override func start() {
        present(animated: true, onDismissed: nil)
    }
    
    public override func present(animated: Bool, onDismissed: Coordinator.onDismissedCallback?) {
        controller.view.backgroundColor = .blue
        router.present(controller, animated: animated, onDismissed: onDismissed)
    }
}
