//
//  UITextField + Ext.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit

extension UITextField {
    func setPlaceholder(placeholder: String, _ color: UIColor){
        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: color]
        )
    }
    
    func builder(font: UIFont, textAlignment: NSTextAlignment){
        self.font = font
        self.textAlignment = textAlignment
    }
}
