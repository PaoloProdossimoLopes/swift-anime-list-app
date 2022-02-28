//
//  ForgotPasswordCoordinator.swift
//  ANLIB
//
//  Created by Paolo Prodossimo Lopes on 28/02/22.
//

import Foundation
import ANLIB

final class ForgotPasswordCoordinator: Coordinator {
    
    private var service: ForgotPasswordServiceProtocol {
        return ForgotPasswordService()
    }
    
    private lazy var viewModel: ForgotPasswordViewModel = {
        let viewModel = ForgotPasswordViewModel(service: service)
        viewModel.coordinatorDelagate = self
        return viewModel
    }()
    
    private lazy var controller: ForgotPasswordViewController = {
        let controller = ForgotPasswordViewController(viewModel: viewModel)
        return controller
    }()
    
    override func start() {
        present(animated: true, onDismissed: nil)
    }
    
    override func present(animated: Bool, onDismissed: Coordinator.onDismissedCallback?) {
        router.present(controller, animated: animated, onDismissed: onDismissed)
    }
    
    override func dismiss(animated: Bool, onDismissed: (Coordinator.onDismissedCallback?) = nil) {
        router.dismiss(animated: animated, onDismissed: onDismissed)
    }
    
    deinit {
        print("Dealocated")
    }
}

extension ForgotPasswordCoordinator: ForgotPasswordViewModelToCoordinator {
    func closeForgotPassword() {
        
    }
}
