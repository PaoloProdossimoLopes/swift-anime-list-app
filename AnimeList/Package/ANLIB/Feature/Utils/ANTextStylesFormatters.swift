//
//  ANTextStylesFormatters.swift
//  ANLIB
//
//  Created by Paolo Prodossimo Lopes on 28/02/22.
//

import Foundation

open class ANTextStylesFormatters {
    
    public static func makeTwoDiferentStyleInText(partOne: String, partTwo: String) -> NSMutableAttributedString {
        let attributedText = NSMutableAttributedString(
            string: partOne, attributes: [.font: UIFont.systemFont(ofSize: 17),
                                          .foregroundColor: UIColor.black]
        )
        
        attributedText.append(NSAttributedString(
            string: partTwo, attributes: [.font: UIFont.boldSystemFont(ofSize: 17),
                                          .foregroundColor: UIColor.red]
        ))
        
        return attributedText
    }
    
    public static func underlinePropertieGetter(_ text: String) -> NSAttributedString {
        return NSMutableAttributedString(
            string: text,
            attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]
        )
    }
}
