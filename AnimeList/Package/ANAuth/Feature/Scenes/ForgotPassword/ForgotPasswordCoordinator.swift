//
//  ForgotPasswordCoordinator.swift
//  ANLIB
//
//  Created by Paolo Prodossimo Lopes on 28/02/22.
//

import Foundation
import ANLIB

protocol ForgotPasswordCoordinatorDelegate: AnyObject {
    func dismissMe()
}

final class ForgotPasswordCoordinator: Coordinator {
    
    //MARK: - Properties
    weak var delegate: ForgotPasswordCoordinatorDelegate?
    
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
    
    //MARK: - Constructor
    init(_ delegate: ForgotPasswordCoordinatorDelegate, router: Router) {
        self.delegate = delegate
        super.init(router: router)
    }
    
    //MARK: - Overrides
    override func start() {
        present(animated: true, onDismissed: nil)
    }
    
    override func present(animated: Bool, onDismissed: Coordinator.onDismissedCallback?) {
        router.present(controller, animated: animated, onDismissed: onDismissed)
    }
    
    override func dismiss(animated: Bool, onDismissed: (Coordinator.onDismissedCallback?) = nil) {
        router.dismiss(animated: animated, onDismissed: onDismissed)
    }
}

//MARK: - ForgotPasswordViewModelToCoordinator
extension ForgotPasswordCoordinator: ForgotPasswordViewModelToCoordinator {
    func closeForgotPassword(_ controller: ForgotPasswordViewController, shouldDismiss: Bool) {
        if shouldDismiss { dismiss(animated: true, onDismissed: nil) }
        delegate?.dismissMe()
    }
}
