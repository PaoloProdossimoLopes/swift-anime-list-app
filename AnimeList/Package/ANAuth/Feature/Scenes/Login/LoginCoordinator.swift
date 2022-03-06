//
//  LoginCoordinator.swift
//  ANAuth
//
//  Created by Paolo Prodossimo Lopes on 28/02/22.
//

import Foundation
import ANLIB

protocol LoginCoordToModuleCoordDelegate: AnyObject {
    func goToHome(_ controller: LoginViewController)
}

final class LoginCoordinator: Coordinator {
    
    //MARK: - Properties
    weak var delegate: LoginCoordToModuleCoordDelegate?
    
    private var service: LoginServiceProtocol = LoginService()
    private lazy var viewModel: LoginViewModel = .init(self, service: service)
    private lazy var controller: LoginViewController = .init(viewModel: viewModel)
    
    private var forgotPasswordCoordinator: ForgotPasswordCoordinator?
    private var registerCoordinator: RegistrationCoordinator?
    
    //MARK: - Overriders
    override func start() {
        present(animated: true, onDismissed: {})
    }
    
    override func present(animated: Bool, onDismissed: Coordinator.onDismissedCallback?) {
        router.present(controller, animated: animated, onDismissed: onDismissed)
    }
}

//MARK: - LoginViewModelToCoordinatorDelegate
extension LoginCoordinator: LoginViewModelToCoordinatorDelegate {
    func goToHome(_ controller: LoginViewController) {
        delegate?.goToHome(controller)
    }
    
    func goToForgotPassword(_ controller: LoginViewController) {
        let modalRouter = ModalNavigationRouter(parentViewController: controller)
        forgotPasswordCoordinator = ForgotPasswordCoordinator(self, router: modalRouter)
        forgotPasswordCoordinator?.start()
    }
    
    func goToRegister(_ controller: LoginViewController) {
        registerCoordinator = RegistrationCoordinator(router: router)
        registerCoordinator?.delegate = self
        registerCoordinator?.start()
    }
}

//MARK: - ForgotPasswordCoordinatorDelegate
extension LoginCoordinator: ForgotPasswordCoordinatorDelegate {
    func dismissMe() {
        forgotPasswordCoordinator = nil //Dealoc coord to avoid retain cycle
    }
}

extension LoginCoordinator: RegistrationCoordinatorDelegate {
    func dealocate() {
        registerCoordinator = nil
    }
}
