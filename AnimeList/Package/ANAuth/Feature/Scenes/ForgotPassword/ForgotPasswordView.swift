//
//  ForgotPasswordView.swift
//  ANAuth
//
//  Created by Paolo Prodossimo Lopes on 28/02/22.
//

import UIKit
import ANLIB

protocol ForgotPasswordViewDelegate: AnyObject {
    func emailToRecoveryAccountWasChanged()
    func recovetyPasswordButtonHandleTapped(_ loader: ANPrimaryButtonHideDelagate)
}

final class ForgotPasswordView: UIView {
    
    //MARK: - Properties
    weak var delegate: ForgotPasswordViewDelegate?
    
    //MARK: - UI Components
    private(set) lazy var emailToRecoveryAccountTextField: ANPrimaryTextField = {
        let tf = ANPrimaryTextField(
            self, image: "envelope", placeholder: "E-mail",
            validation: ANValidators.validateAsEmail)
        return tf
    }()
    
    private(set) lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Caso deseje recuperar a sua senha
        Digite seu o seu email de cadastro para recever nele as informaçoes
        para que a sua conta seja recuperada.
        """
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private(set) lazy var recoveryPasswordButton: ANPrimaryButton = {
        let button = ANPrimaryButton.init(self, btnTitle: "Recuperar")
        return button
    }()
    
    //MARK: - Constructor
    init(_ delegate: ForgotPasswordViewDelegate?) {
        self.delegate = delegate
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - ANViewLayoutConfigurator
extension ForgotPasswordView: ANViewLayoutConfigurator {
    func configureHierarcy() {
        addSubview(informationLabel)
        addSubview(emailToRecoveryAccountTextField)
        addSubview(recoveryPasswordButton)
    }
    
    func configureConstrants() {
        informationLabel.ANStylable.applyConstraint { [weak self] view in
            guard let self = self else { return }
            view.top(reference: self.topAnchor, spacing: 50)
            view.leading(reference: self.leadingAnchor, spacing: 20)
            view.trailing(reference: self.trailingAnchor, spacing: -20)
        }
        
        emailToRecoveryAccountTextField.ANStylable.applyConstraint { [weak self] view in
            guard let self = self else { return }
            view.top(reference: self.informationLabel.bottomAnchor, spacing: 20)
            view.leading(reference: self.informationLabel.leadingAnchor)
            view.trailing(reference: self.informationLabel.trailingAnchor)
        }
        
        recoveryPasswordButton.ANStylable.applyConstraint { [weak self] view in
            guard let self = self else { return }
            view.top(reference: self.emailToRecoveryAccountTextField.bottomAnchor, spacing: 20)
            view.leading(reference: self.emailToRecoveryAccountTextField.leadingAnchor)
            view.trailing(reference: self.emailToRecoveryAccountTextField.trailingAnchor)
        }
    }
    
    func confugreStyle() {
        backgroundColor = .white
    }
}

//MARK: - ANPrimaryTextFieldDelegate
extension ForgotPasswordView: ANPrimaryTextFieldDelegate {
    func notifyWhenTextFieldWasChanged() {
        delegate?.emailToRecoveryAccountWasChanged()
        
        let validations = [emailToRecoveryAccountTextField.getValidationStatus()]
        recoveryPasswordButton.validateButton(conditions: validations)
    }
}

//MARK: - ANPrimaryButtonDelegate
extension ForgotPasswordView: ANPrimaryButtonDelegate {
    func handleButtonTapped(_ loader: ANPrimaryButtonHideDelagate) {
        delegate?.recovetyPasswordButtonHandleTapped(loader)
    }
}
