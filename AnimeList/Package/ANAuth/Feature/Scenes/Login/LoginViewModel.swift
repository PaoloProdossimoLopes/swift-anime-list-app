//
//  LoginViewModel.swift
//  ANAuth
//
//  Created by Paolo Prodossimo Lopes on 28/02/22.
//

import ANLIB

protocol LoginViewModelToViewDelegate: AnyObject {
    
}

protocol LoginViewModelToCoordinatorDelegate: AnyObject {
    func goToHome(_ controller: LoginViewController)
    func goToForgotPassword(_ controller: LoginViewController)
    func goToRegister(_ controller: LoginViewController)
}

protocol LoginViewModelProtocol {
    var viewDelegate: LoginViewModelToViewDelegate? { get set }
    
    func textFieldUpdatedHandle()
    func enterButtonHandleTapped(_ controller: LoginViewController, loader: ANPrimaryButtonHideDelagate)
    func forgotPasswordHandleTapped(_ controller: LoginViewController)
    func registerButtonHandleTapped(_ controller: LoginViewController)
}

final class LoginViewModel: LoginViewModelProtocol {
   
    //MARK: - Delegates
    weak var viewDelegate: LoginViewModelToViewDelegate?
    weak var coordinatorDelegate: LoginViewModelToCoordinatorDelegate?
    
    //MARK: - Properties
    private let service: LoginServiceProtocol
    
    //MARK: - Constructor
    init(_ coordinatorDelegate: LoginViewModelToCoordinatorDelegate, service: LoginServiceProtocol) {
        self.coordinatorDelegate = coordinatorDelegate
        self.service = service
    }
    
    //MARK: - Functions
    func textFieldUpdatedHandle() {
        
    }
    
    func enterButtonHandleTapped(_ controller: LoginViewController, loader: ANPrimaryButtonHideDelagate) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            loader.hideLoader()
            self.coordinatorDelegate?.goToHome(controller)
        }
    }
    
    func forgotPasswordHandleTapped(_ controller: LoginViewController) {
        coordinatorDelegate?.goToForgotPassword(controller)
    }
    
    func registerButtonHandleTapped(_ controller: LoginViewController) {
        coordinatorDelegate?.goToRegister(controller)
    }
}
