//
//  FMPrimaryButton.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import UIKit

public typealias ANPrimaryButtonProtocol = (
    UIButton & ANViewLayoutConfigurator
)

public protocol ANPrimaryButtonHideDelagate: AnyObject {
    func hideLoader()
}

public protocol ANPrimaryButtonDelegate: AnyObject {
    func handleButtonTapped(_ loader: ANPrimaryButtonHideDelagate)
}

open class ANPrimaryButton: ANPrimaryButtonProtocol {
    
    //MARK: - Properties
    
    private weak var primaryDelegate: ANPrimaryButtonDelegate?
    
    public let buttonTitle: String
    public let isAnimate: Bool
    public let hasLoader: Bool
    
    public let loadingIndicator: ProgressView = {
        let progress = ProgressView(
            colors: [.white],
            lineWidth: 5
        )
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    //MARK: - Constructor
    
    public init(
        _ delegate: ANPrimaryButtonDelegate?,
        btnTitle: String, isAnimate: Bool = true, hasLoader: Bool = false
    ) {
        self.primaryDelegate = delegate
        self.buttonTitle = btnTitle
        self.isAnimate = isAnimate
        self.hasLoader = hasLoader
        super.init(frame: .zero)
        commonInit()
        addTarget(self, action: #selector(primaryButtonWasTapped), for: .touchUpInside)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - FMConfigureLayoutProtocol
    
    public func configureHierarcy() { /*Is not nescessary*/ }
    
    public func configureConstrants() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    public func confugreStyle() {
        setTitle(buttonTitle, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 18)
        layer.cornerRadius = 5
        animationManager(false)
    }
    
    //MARK: - Helpers
    
    private func animationManager(_ isValid: Bool) {
        if isAnimate {
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.configureButtonState(isValid)
            }
        } else {
            configureButtonState(isValid)
        }
    }
    
    private func configureButtonState(_ isValid: Bool) {
        setTitleColor(isValid ? .white : .darkGray, for: .normal)
        backgroundColor = isValid ? .red : .lightGray.withAlphaComponent(0.4)
        isEnabled = isValid
    }
    
    //MARK: - Setters
    
    public func validateButton(conditions: [Bool]) {
        if conditions.contains(false) { animationManager(false) }
        else { animationManager(true) }
    }
    
    //MARK: - Selectors
    
    @objc private func primaryButtonWasTapped() {
        self.setTitleColor(.clear, for: .normal)
        loadingIndicator.showLoading(self)
        primaryDelegate?.handleButtonTapped(self)
    }
}

//MARK: - FMPrimaryButtonDisableHideDelagate
extension ANPrimaryButton: ANPrimaryButtonHideDelagate {
    public func hideLoader() {
        self.setTitleColor(.white, for: .normal)
        loadingIndicator.stop()
    }
}

