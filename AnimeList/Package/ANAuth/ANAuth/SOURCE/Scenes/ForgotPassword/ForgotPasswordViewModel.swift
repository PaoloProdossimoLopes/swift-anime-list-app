//
//  ForgotPasswordViewModel.swift
//  ANLIB
//
//  Created by Paolo Prodossimo Lopes on 28/02/22.
//

import Foundation

protocol ForgotPasswordViewModelToController: AnyObject {
    
}

protocol ForgotPasswordViewModelToCoordinator: AnyObject {
    func closeForgotPassword(_ controller: ForgotPasswordViewController, shouldDismiss: Bool)
}

protocol ForgotPasswordViewModelProtocol {
    var viewDelegate: ForgotPasswordViewModelToController? { get set }
    func recoveryButtonhandle(_ controller: ForgotPasswordViewController)
    func viewDidDisapearHandle(_ controller: ForgotPasswordViewController)
}

final class ForgotPasswordViewModel: ForgotPasswordViewModelProtocol {
    
    //MARK: - Delegates
    weak var viewDelegate: ForgotPasswordViewModelToController?
    weak var coordinatorDelagate: ForgotPasswordViewModelToCoordinator?
    
    //MARK: - Properties
    private let service: ForgotPasswordServiceProtocol
    
    //MARK: - Constructor
    init(service: ForgotPasswordServiceProtocol) {
        self.service = service
    }
    
    //MARK: - Methods
    func recoveryButtonhandle(_ controller: ForgotPasswordViewController) {
        //TODO: Call API
        //CLOSE:
        coordinatorDelagate?.closeForgotPassword(controller, shouldDismiss: true)
    }
    
    func viewDidDisapearHandle(_ controller: ForgotPasswordViewController) {
        coordinatorDelagate?.closeForgotPassword(controller, shouldDismiss: false)
    }
}
