//
//  LoginView.swift
//  ANAuth
//
//  Created by Paolo Prodossimo Lopes on 28/02/22.
//

import UIKit
import ANLIB

typealias LoginConformableWithProtocols = (ANPrimaryTextFieldDelegate & ANPrimaryButtonDelegate)

protocol LoginViewDelegate: AnyObject {
    func textFieldUpdatedHandle()
    func enterButtonHandleTapped(_ loader: ANPrimaryButtonHideDelagate)
    func forgotPasswordButtonHandleTapped()
    func registerButtonHandleTapped(_ sender: UIButton)
}

final class LoginView: UIView {
    
    weak var delegate: (LoginViewDelegate)?
    
    //MARK: - UI Components
    
    private(set) lazy var emailTF: ANPrimaryTextField = .init(
        self, image: "envelope", placeholder: "E-mail",
        validation: ANValidators.validateAsEmail
    )
    
    private(set) lazy var passwordTF: ANPrimaryTextField = .init(
        self, image: "lock", placeholder: "Senha", isSecure: true,
        validation: ANValidators.validateAsWeakPasswordForce
    )
    
    private lazy var textFieldsStacks: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            emailTF, passwordTF, forgotYourPasswordButton, enterButton
        ])
        stack.axis = .vertical
        stack.distribution = .equalCentering
        stack.spacing = 30
        return stack
    }()
    
    private(set) lazy var enterButton: ANPrimaryButton = {
        return ANPrimaryButton(self, btnTitle: "Entrar")
    }()
    
    private(set) lazy var captionMessageWithButton: UIStackView = {
        let label = UILabel()
        label.text = "Ainda não possui uma conta?"
        label.textColor = .black
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 12)
        
        let button = UIButton()
        button.setTitle("Registrar-se", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(registerButtonWasTapped), for: .touchUpInside)
        
        let stack = UIStackView(arrangedSubviews: [label, button])
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    private lazy var forgotYourPasswordButton: UILabel = {
        let label = UILabel()
        label.attributedText = "Esqueceu sua senha".underLined
        label.textColor = .red
        label.textAlignment = .right
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(forgotPasswordButtonWasTapped))
        label.addGestureRecognizer(tap)
        label.isUserInteractionEnabled = true
        
        return label
    }()
    
    //MARK: - Constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selector
    @objc private func forgotPasswordButtonWasTapped() {
        delegate?.forgotPasswordButtonHandleTapped()
    }
    
    @objc private func registerButtonWasTapped(_ sender: UIButton) {
        delegate?.registerButtonHandleTapped(sender)
    }
}

extension LoginView: ANViewLayoutConfigurator {
    func configureHierarcy() {
        addSubview(textFieldsStacks)
        addSubview(captionMessageWithButton)
    }
    
    func configureConstrants() {
        textFieldsStacks.ANStylable.applyConstraint { [weak self] view in
            guard let self = self else { return }
            view.centerY(reference: self.centerYAnchor)
            view.leading(reference: self.leadingAnchor, spacing: 30)
            view.trailing(reference: self.trailingAnchor, spacing: -30)
        }
        
        captionMessageWithButton.ANStylable.applyConstraint { [weak self] view in
            guard let self = self else { return }
            view.bottom(reference: self.bottomAnchor, spacing: -20)
            view.centerX(reference: self.centerXAnchor)
        }
    }
    
    func confugreStyle() {
        backgroundColor = .white
    }
}

//MARK: - ANPrimaryTextFieldDelegate
extension LoginView: ANPrimaryTextFieldDelegate {
    func notifyWhenTextFieldWasChanged() {
        delegate?.textFieldUpdatedHandle()
        enterButton.validateButton(conditions: [
            emailTF.getValidationStatus(),
            passwordTF.getValidationStatus()
        ])
    }
}

//MARK: - ANPrimaryButtonDelegate
extension LoginView: ANPrimaryButtonDelegate {
    func handleButtonTapped(_ loader: ANPrimaryButtonHideDelagate) {
        delegate?.enterButtonHandleTapped(loader)
    }
}
