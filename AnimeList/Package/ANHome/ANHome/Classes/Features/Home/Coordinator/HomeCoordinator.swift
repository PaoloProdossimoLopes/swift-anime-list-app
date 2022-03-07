//
//  HomeCoordinator.swift
//  ANAuth
//
//  Created by Paolo Prodossimo Lopes on 01/03/22.
//

import UIKit

import ANLIB

protocol HomeCoordinatorProtocol {
    
}

final class HomeCoordinator: Coordinator {
    
    private var controller: HomeViewController?
    
    override func start() {
        let service = HomeService()
        let view = HomeView()
        let viewModel = HomeViewModel(self, service: service)
        controller = HomeViewController(contentView: view, viewModel: viewModel)
        
        present(animated: true, onDismissed: nil)
    }
    
    override func present(animated: Bool, onDismissed: Coordinator.onDismissedCallback?) {
        guard let controller = controller else { return }
        if let modal = router as? ModalNavigationRouter {
            modal.typeOfModal = .fullScreen
            modal.present(controller, animated: animated, onDismissed: onDismissed)
        }
    }
}

//MARK: - HomeViewModelToCoordinatorDelegate
extension HomeCoordinator: HomeViewModelToCoordinatorDelegate {
    
}
