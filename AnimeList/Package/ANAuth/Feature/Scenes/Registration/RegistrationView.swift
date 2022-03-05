//
//  RegistrationView.swift
//  ANAuth
//
//  Created by Paolo Prodossimo Lopes on 01/03/22.
//

import Foundation
import UIKit
import ANLIB

protocol RegistrationViewDelegate: AnyObject {
    func registerButtonHandleTapped(_ loader: ANPrimaryButtonHideDelagate)
    func alreadyHaveAccountHandleTapped()
}

final class RegistrationView: UIView {
    
    //MARK: - Properties
    
    weak var delegate: RegistrationViewDelegate?
    
    //MARK: - UI Components
    private(set) lazy var nameTF: ANPrimaryTextField = {
        return .init(self, image: "person", placeholder: "Nome Completo")
    }()
    
    private(set) lazy var usernameTF: ANPrimaryTextField = {
        return .init(self, image: "person", placeholder: "Nome de usuario")
    }()
    
    private(set) lazy var emailTF: ANPrimaryTextField = {
        return .init(
            self, image: "envelope",
            placeholder: "Email",
            validation: ANValidators.validateAsEmail
        )
    }()
    
    private(set) lazy var passwordTF: ANPrimaryTextField = {
        return .init(
            self, image: "lock", placeholder: "Senha",
            isSecure: true, validation: ANValidators.validateAsMediumPasswordForce
        )
    }()
    
    private(set) lazy var registrationButton: ANPrimaryButton = {
        return .init(self, btnTitle: "Registrar-se")
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            nameTF, usernameTF, emailTF, passwordTF, registrationButton
        ])
        stack.axis = .vertical
        stack.distribution = .equalCentering
        stack.spacing = 20
        return stack
    }()
    
    private(set) lazy var captionMessageWithButton: UIStackView = {
        let label = UILabel()
        label.text = "Já possui uma conta?"
        label.textColor = .black
        label.textAlignment = .right
        
        let button = UIButton()
        button.setTitle("Entre", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(alreadyHaveAccotunButton), for: .touchUpInside)
        
        let stack = UIStackView(arrangedSubviews: [label, button])
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    //MARK: - Constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors
    @objc private func alreadyHaveAccotunButton() {
        delegate?.alreadyHaveAccountHandleTapped()
    }
}

//MARK: - ANViewLayoutConfigurator
extension RegistrationView: ANViewLayoutConfigurator {
    func configureHierarcy() {
        addSubview(mainStackView)
        addSubview(captionMessageWithButton)
    }
    
    func configureConstrants() {
        mainStackView.ANStylable.applyConstraint { [weak self] view in
            guard let self = self else { return }
            view.centerY(reference: self.centerYAnchor)
            view.leading(reference: self.leadingAnchor, spacing: 20)
            view.trailing(reference: self.trailingAnchor, spacing: -20)
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
extension RegistrationView: ANPrimaryTextFieldDelegate {
    func notifyWhenTextFieldWasChanged() {
        let conditions: [Bool] = [
            (nameTF.getText().isEmpty == false),
            (usernameTF.getText().isEmpty == false),
            emailTF.getValidationStatus(),
            passwordTF.getValidationStatus()
        ]
        
        registrationButton.validateButton(conditions: conditions)
    }
}

//MARK: - ANPrimaryButtonDelegate
extension RegistrationView: ANPrimaryButtonDelegate {
    func handleButtonTapped(_ loader: ANPrimaryButtonHideDelagate) {
        delegate?.registerButtonHandleTapped(loader)
    }
}
