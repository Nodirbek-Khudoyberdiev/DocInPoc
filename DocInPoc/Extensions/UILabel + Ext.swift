//
//  UILabel + Ext.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit

extension UILabel {
    
    convenience init(text: String? = nil, font: UIFont, color: UIColor, lines: Int, alignment: NSTextAlignment = .left){
        self.init()
        self.text = text
        self.font = font
        self.textColor = color
        self.numberOfLines = lines
        self.textAlignment = alignment
    }
    
    func build(text: String? = nil, font: UIFont, color: UIColor, lines: Int, alignment: NSTextAlignment = .left){
        self.text = text
        self.font = font
        self.textColor = color
        self.numberOfLines = lines
        self.textAlignment = alignment
    }
}
