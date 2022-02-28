//
//  ForgotPasswordViewController.swift
//  ANLIB
//
//  Created by Paolo Prodossimo Lopes on 28/02/22.
//

import UIKit
import ANLIB

final class ForgotPasswordViewController: UIViewController {
    
    private var viewModel: ForgotPasswordViewModelProtocol
    private(set) lazy var customView: ForgotPasswordView = .init(self)
    
    init(viewModel: ForgotPasswordViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDelegates()
    }
    
    private func configureDelegates() {
        viewModel.viewDelegate = self
    }
}

extension ForgotPasswordViewController: ForgotPasswordViewModelToController {
    
}

extension ForgotPasswordViewController: ForgotPasswordViewDelegate {
    func emailToRecoveryAccountWasChanged() {
        
    }
    
    func recovetyPasswordButtonHandleTapped(_ loader: ANPrimaryButtonHideDelagate) {
        loader.hideLoader()
        viewModel.recoveryButtonhandle()
    }
}
