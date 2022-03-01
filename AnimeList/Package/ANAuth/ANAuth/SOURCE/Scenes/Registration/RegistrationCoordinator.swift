//
//  RegistrationCoordinator.swift
//  ANAuth
//
//  Created by Paolo Prodossimo Lopes on 01/03/22.
//

import ANLIB

protocol RegistrationCoordinatorDelegate: AnyObject {
    func dealocate()
}

final class RegistrationCoordinator: Coordinator {
    
    //MARK: - Delegate
    weak var delegate: RegistrationCoordinatorDelegate?
    
    //MARK: - Properties
    private let service: RegistrationServiceProtocol = RegistrationService()
    
    private lazy var viewModel: RegistrationViewModel = {
        let viewModel = RegistrationViewModel(service: service)
        viewModel.coordinatorDelegate = self
        return viewModel
    }()
    
    private lazy var controller: RegistrationViewController = .init(viewModel: viewModel)
    
    //MARK: - Overreding
    override func start() {
        present(animated: true, onDismissed: nil)
    }
    
    override func present(animated: Bool, onDismissed: Coordinator.onDismissedCallback?) {
        if let navRouter = router as? ModalNavigationRouter {
            navRouter.hideNavigationBar = true
            navRouter.present(controller, animated: animated, onDismissed: onDismissed)
        }
    }
}

//MARK: - RegistrationViewModelToCoordinatorDelegate
extension RegistrationCoordinator: RegistrationViewModelToCoordinatorDelegate {
    func dismissRegistration() {
        dismiss(animated: true, onDismissed: nil)
        delegate?.dealocate()
    }
}
