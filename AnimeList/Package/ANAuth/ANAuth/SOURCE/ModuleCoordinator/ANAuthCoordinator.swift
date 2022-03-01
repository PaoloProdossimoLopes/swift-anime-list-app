//
//  ANAuthCoordinator.swift
//  ANLIB
//
//  Created by Paolo Prodossimo Lopes on 28/02/22.
//

import ANLIB
import UIKit

public protocol ANAuthCoordinatorDelegate: AnyObject {
    func goToHome(_ controller: LoginViewController)
//    func goToHome(_ controller: RegisterViewController)
}

public final class ANAuthCoordinator: Coordinator {
    
    public weak var delegate: ANAuthCoordinatorDelegate?
    private var loginCoordinator: LoginCoordinator?
    
    
    public override func start() {
        loginCoordinator = LoginCoordinator(router: router)
        loginCoordinator?.delegate = self
        loginCoordinator?.start()
    }
}

extension ANAuthCoordinator: LoginCoordToModuleCoordDelegate {
    func goToHome(_ controller: LoginViewController) {
        delegate?.goToHome(controller)
    }
}
