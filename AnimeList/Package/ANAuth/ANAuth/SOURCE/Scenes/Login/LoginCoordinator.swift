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
    
    weak var delegate: LoginCoordToModuleCoordDelegate?
    
    private var service: LoginServiceProtocol {
        return LoginService()
    }
    
    private var controller: LoginViewController!
    
    private var forgotPasswordCoordinator: ForgotPasswordCoordinator?
//    private var registerCoordinator: Coordinator?
    
    override func start() {
        let viewModel = LoginViewModel(self, service: service)
        controller = LoginViewController(viewModel: viewModel)
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
//        registerCoordinator = Coordinator(router: router)
//        registerCoordinator?.start()
    }
}

//MARK: - ForgotPasswordCoordinatorDelegate
extension LoginCoordinator: ForgotPasswordCoordinatorDelegate {
    func dismissMe() {
        forgotPasswordCoordinator = nil //Dealoc coord to avoid retain cycle
    }
}
