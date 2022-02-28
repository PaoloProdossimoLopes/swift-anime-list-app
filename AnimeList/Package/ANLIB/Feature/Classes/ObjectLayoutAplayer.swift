//
//  Classes.swift
//  ANAuth
//
//  Created by Paolo Prodossimo Lopes on 28/02/22.
//

import UIKit

open class ObjectLayoutAplayer {
    
    private let support: UIView
    
    public init(_ support: UIView) {
        self.support = support
        self.support.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func applyConstraint(_ callback: (ConstraintableLayout) -> ()) {
        let object: ConstraintableLayout = .init(support)
        callback(object)
    }
}
