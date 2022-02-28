//
//  LoginViewController.swift
//  ANAuth
//
//  Created by Paolo Prodossimo Lopes on 28/02/22.
//

import UIKit
import ANLIB

public final class LoginViewController: UIViewController {
    
    private var viewModel: LoginViewModelProtocol { didSet{
        viewModel.viewDelegate = self
    } }
    private var customView: LoginView {
        didSet { customView.delegate = self }
    }
    
    init(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        self.customView = LoginView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        super.loadView()
        view = customView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
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

