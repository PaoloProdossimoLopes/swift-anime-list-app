//
//  RegistrationViewController.swift
//  ANAuth
//
//  Created by Paolo Prodossimo Lopes on 01/03/22.
//

import ANLIB
import UIKit

final class RegistrationViewController: UIViewController {
    
    //MARK: - Properties
    private var viewModel: RegistrationViewModelProtocol
    private(set) var customView: RegistrationView
    
    
    //MARK: - Constructor
    init(viewModel: RegistrationViewModelProtocol) {
        self.viewModel = viewModel
        self.customView = RegistrationView()
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
        customView.delegate = self
        viewModel.viewDelegate = self
    }
}

//MARK: - RegistrationViewDelegate
extension RegistrationViewController: RegistrationViewDelegate {
    func registerButtonHandleTapped(_ loader: ANPrimaryButtonHideDelagate) {
        viewModel.registerHandleTapped(self, loader: loader)
    }
    
    func alreadyHaveAccountHandleTapped() {
        viewModel.alreadyHaveaccountHandleTapped(self)
    }
}

//MARK: - RegistrationViewModelToViewDelegate
extension RegistrationViewController: RegistrationViewModelToViewDelegate {
    func updateView() {
        
    }
}

