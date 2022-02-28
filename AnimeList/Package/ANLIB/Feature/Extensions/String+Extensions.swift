//
//  String+Extensions.swift
//  ANLIB
//
//  Created by Paolo Prodossimo Lopes on 28/02/22.
//

import Foundation

public extension String {
    var underLined: NSAttributedString {
        ANTextStylesFormatters.underlinePropertieGetter(self)
    }
}
