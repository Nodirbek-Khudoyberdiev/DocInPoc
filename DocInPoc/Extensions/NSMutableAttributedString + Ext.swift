//
//  NSMutableAttributedString + Ext.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit

extension NSMutableAttributedString {
    func setColorForText(textForAttribute: String, withColor color: UIColor, underline: Bool = false) {
        let range: NSRange = mutableString.range(of: textForAttribute, options: .caseInsensitive)
        addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        if underline {
            addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
//            addAttribute(NSAttributedString.Key.baselineOffset, value: -5, range: range)
        }
    }
}
