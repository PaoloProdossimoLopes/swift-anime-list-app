//
//  RegistrationViewModel.swift
//  ANAuth
//
//  Created by Paolo Prodossimo Lopes on 01/03/22.
//

import Foundation
import ANLIB


protocol RegistrationViewModelToViewDelegate: AnyObject {
    func updateView()
}

protocol RegistrationViewModelToCoordinatorDelegate: AnyObject {
    func dismissRegistration()
}

protocol RegistrationViewModelProtocol {
    var viewDelegate: RegistrationViewModelToViewDelegate? { get set }
    
    func registerHandleTapped(
        _ viewController: RegistrationViewController,
        loader: ANPrimaryButtonHideDelagate
    )
    
    func alreadyHaveaccountHandleTapped(_ viewController: RegistrationViewController)
}

final class RegistrationViewModel: RegistrationViewModelProtocol {
    
    //MARK: - Delegates
    weak var viewDelegate: RegistrationViewModelToViewDelegate?
    weak var coordinatorDelegate: RegistrationViewModelToCoordinatorDelegate?
    
    //MARK: - Properties
    let service: RegistrationServiceProtocol
    
    //MARK: - Constructor
    init(service: RegistrationServiceProtocol) {
        self.service = service
    }
    
    //MARK: - Methods
    func registerHandleTapped(
        _ viewController: RegistrationViewController,
        loader: ANPrimaryButtonHideDelagate
    ) {
        //TODO: Register user with service
        //Dissmiss view when completed and success
        coordinatorDelegate?.dismissRegistration()
    }
    
    func alreadyHaveaccountHandleTapped(_ viewController: RegistrationViewController) {
        coordinatorDelegate?.dismissRegistration()
    }
}
