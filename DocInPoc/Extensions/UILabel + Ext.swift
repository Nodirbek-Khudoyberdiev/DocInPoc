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

extension UILabel {

    func highlight(searchedText: [String], color: UIColor, font: UIFont) {
        guard let txtLabel = self.text else { return }

        let attributeTxt = NSMutableAttributedString(string: txtLabel)

        searchedText.forEach {
            let searchedText = $0.lowercased()
            let range: NSRange = attributeTxt.mutableString.range(of: searchedText, options: .caseInsensitive)
            
            attributeTxt.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
            attributeTxt.addAttribute(NSAttributedString.Key.font, value: font, range: range)
        }

        self.attributedText = attributeTxt
    }

}
