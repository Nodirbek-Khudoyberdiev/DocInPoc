//
//  DipFonts.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit

enum CerraFonts: String {
    case light = "CeraPro-Light"
    case medium = "CeraPro-Medium"
    case regular = "CeraPro-Regular"
    case bold = "CeraPro-Bold"
    case black = "CeraPro-Black"
    case thin = "CeraPro-Thin"
}

extension UIFont {
    
    static func cerra(font: CerraFonts, size: CGFloat) -> UIFont {
        return UIFont(name: font.rawValue, size: size)!
    }
    
    static func lightFont(size: CGFloat) -> UIFont {
        return UIFont(name: CerraFonts.light.rawValue, size: size)!
    }
    
    static func regularFont(size: CGFloat) -> UIFont {
        return UIFont(name: CerraFonts.regular.rawValue, size: size)!
    }
    
    static func mediumFont(size: CGFloat) -> UIFont {
        return UIFont(name: CerraFonts.medium.rawValue, size: size)!
    }
    
    static func boldFont(size: CGFloat) -> UIFont {
        return UIFont(name: CerraFonts.bold.rawValue, size: size)!
    }
    
    static func blackFont(size: CGFloat) -> UIFont {
        return UIFont(name: CerraFonts.black.rawValue, size: size)!
    }
    
    static func thinFont(size: CGFloat) -> UIFont {
        return UIFont(name: CerraFonts.thin.rawValue, size: size)!
    }
    
}


