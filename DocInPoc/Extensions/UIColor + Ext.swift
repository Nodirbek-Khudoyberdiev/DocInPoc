//
//  UIColor + Ext.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    static let appPrimaryColor = UIColor(hex: "199A8E")
    static let appDarkColor = UIColor(hex: "101623")
    static let appBorderColor = UIColor(hex: "E5E7EB")
    
    struct Gray {
        static let appGray = UIColor(hex: "677294")
        static let selectingGray = UIColor(hex: "D0D5DD")
    }
    
//    struct Blue {
//        static let _2E85FF = UIColor(hex: "2E85FF")
//    }
//    
//    struct Main {
//        static let _300 = UIColor(hex: "58D5D3")
//        static let _500 = UIColor(hex: "26A2A6")
//        static let _600 = UIColor(hex: "1C7F85")
//        static let _400 = UIColor(hex: "40BFC1")
//        static let _200 = UIColor(hex: "A3ECE8")
//        static let _50 = UIColor(hex: "F1FCFB")
//    }
//
//    struct Error {
//        static let _300 = UIColor(hex: "FDA29B")
//    }
    
//    struct Gray {
//        
//    }
    
    
    

}


