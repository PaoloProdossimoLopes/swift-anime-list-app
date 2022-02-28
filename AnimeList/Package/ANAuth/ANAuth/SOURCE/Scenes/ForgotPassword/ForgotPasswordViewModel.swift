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
    func closeForgotPassword()
}

protocol ForgotPasswordViewModelProtocol {
    var viewDelegate: ForgotPasswordViewModelToController? { get set }
    func recoveryButtonhandle()
}

final class ForgotPasswordViewModel: ForgotPasswordViewModelProtocol {
    
    weak var viewDelegate: ForgotPasswordViewModelToController?
    weak var coordinatorDelagate: ForgotPasswordViewModelToCoordinator?
    
    private let service: ForgotPasswordServiceProtocol
    
    init(service: ForgotPasswordServiceProtocol) {
        self.service = service
    }
    
    func recoveryButtonhandle() {
        //TODO: Call API
        //CLOSE:
        coordinatorDelagate?.closeForgotPassword()
    }
}
