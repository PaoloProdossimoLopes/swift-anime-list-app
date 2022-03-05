//
//  ForgotPasswordViewController.swift
//  ANLIB
//
//  Created by Paolo Prodossimo Lopes on 28/02/22.
//

import UIKit
import ANLIB

final class ForgotPasswordViewController: UIViewController {
    
    //MARK: - Properties
    private var viewModel: ForgotPasswordViewModelProtocol
    private(set) lazy var customView: ForgotPasswordView = .init(self)
    
    
    //MARK: - Constructor
    init(viewModel: ForgotPasswordViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDelegates()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisapearHandle(self)
    }
    
    //MARK: - Helpers
    private func configureDelegates() {
        viewModel.viewDelegate = self
    }
}

//MARK: - ForgotPasswordViewModelToController
extension ForgotPasswordViewController: ForgotPasswordViewModelToController {
    //TODO:
}

//MARK: - ForgotPasswordViewDelegate
extension ForgotPasswordViewController: ForgotPasswordViewDelegate {
    func emailToRecoveryAccountWasChanged() {
        //TODO: 
    }
    
    func recovetyPasswordButtonHandleTapped(_ loader: ANPrimaryButtonHideDelagate) {
        loader.hideLoader()
        viewModel.recoveryButtonhandle(self)
    }
}
