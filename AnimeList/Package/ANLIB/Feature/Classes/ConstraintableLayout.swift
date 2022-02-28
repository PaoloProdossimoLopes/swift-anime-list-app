//
//  ConstraintableLayout.swift
//  ANAuth
//
//  Created by Paolo Prodossimo Lopes on 28/02/22.
//

import UIKit

public class ConstraintableLayout {
    
    private let support: UIView
    
    public init(_ support: UIView) {
        self.support = support
    }
    
    public func top(reference: NSLayoutYAxisAnchor?, spacing: CGFloat = 0) {
        if let ref = reference {
            support.topAnchor.constraint(equalTo: ref, constant: spacing).isActive = true
        }
    }
    
    public func leading(reference: NSLayoutXAxisAnchor?, spacing: CGFloat = 0) {
        if let ref = reference {
            support.leadingAnchor.constraint(equalTo: ref, constant: spacing).isActive = true
        }
    }
    
    public func trailing(reference: NSLayoutXAxisAnchor?, spacing: CGFloat = 0) {
        if let ref = reference {
            support.trailingAnchor.constraint(equalTo: ref, constant: spacing).isActive = true
        }
    }
    
    public func bottom(reference: NSLayoutYAxisAnchor?, spacing: CGFloat = 0) {
        if let ref = reference {
            support.bottomAnchor.constraint(equalTo: ref, constant: spacing).isActive = true
        }
    }
    
    public func centerX(reference: NSLayoutXAxisAnchor?, spacing: CGFloat = 0) {
        if let ref = reference {
            support.centerXAnchor.constraint(equalTo: ref, constant: spacing).isActive = true
        }
    }
    
    public func centerY(reference: NSLayoutYAxisAnchor?, spacing: CGFloat = 0) {
        if let ref = reference {
            support.centerYAnchor.constraint(equalTo: ref, constant: spacing).isActive = true
        }
    }
    
    public func height(size: CGFloat = 0) {
        support.heightAnchor.constraint(equalToConstant: size).isActive = true
    }
    
    public func width(size: CGFloat = 0) {
        support.widthAnchor.constraint(equalToConstant: size).isActive = true
    }
}
