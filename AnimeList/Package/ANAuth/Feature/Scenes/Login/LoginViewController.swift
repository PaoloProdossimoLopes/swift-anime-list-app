//
//  LoginViewController.swift
//  ANAuth
//
//  Created by Paolo Prodossimo Lopes on 28/02/22.
//

import UIKit
import ANLIB

public final class LoginViewController: UIViewController {
    
    //MARK: - Properties
    private var viewModel: LoginViewModelProtocol
    
    let customView: LoginView = .init()
    
    //MARK: - Constructor
    init(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    public override func loadView() {
        super.loadView()
        view = customView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureDelegates()
    }
    
    //MARK: - Helpers
    private func configureDelegates() {
        viewModel.viewDelegate = self
        customView.delegate = self
    }
}

//MARK: - LoginViewModelToViewDelegate
extension LoginViewController: LoginViewModelToViewDelegate {
    
}

//MARK: - LoginViewDelegate
extension LoginViewController: LoginViewDelegate {

    func textFieldUpdatedHandle() {
        viewModel.textFieldUpdatedHandle()
    }

    func enterButtonHandleTapped(_ loader: ANPrimaryButtonHideDelagate) {
        viewModel.enterButtonHandleTapped(self, loader:loader)
    }

    func forgotPasswordButtonHandleTapped() {
        viewModel.forgotPasswordHandleTapped(self)
    }

    func registerButtonHandleTapped(_ sender: UIButton) {
        viewModel.registerButtonHandleTapped(self)
    }
}

