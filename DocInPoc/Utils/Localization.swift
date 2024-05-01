//
//  Localization.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit

enum Localization: String, CaseIterable {
    case ENGLISH = "en"
    case RUSSIAN = "ru"
    case UZ = "uz"
//    case UzCyrclic = "uz-Cyrl"
    
    private static func getValue(_ key: String, comment: String?) -> String {
        let localCode = UserDefaults.standard.getLocaleCode()
        let path = Bundle.main.path(forResource: localCode.rawValue, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return bundle!.localizedString(forKey: key, value: comment, table: nil)
    }
    
    static func getValue(_ key: Strings) -> String {
        return self.getValue(key.rawValue, comment: key.rawValue)
    }
    
    var title: String {
        switch self {
        case .ENGLISH:
            return "English"
        case .UZ:
            return "O'zbek"
        case .RUSSIAN:
            return "Русский"
            //        case .UzCyrclic:
            //            return "Ўзбекча"
            //        }
        }
    }
    
    var image: UIImage? {
        switch self {
        case .ENGLISH:
            return .us
        case .RUSSIAN:
            return .ru
        case .UZ:
            return .uz
        }
    }
}
