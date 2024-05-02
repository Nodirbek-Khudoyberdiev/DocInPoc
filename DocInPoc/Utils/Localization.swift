//
//  Localization.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit

enum Localization: String, CaseIterable {
    case UZ = "uz"
    case ENGLISH = "en"
    case RUSSIAN = "ru"
    case UzCyrclic = "uz-Cyrl"
    
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
        case .UzCyrclic:
            return "Ўзбекча"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .ENGLISH:
            return .us
        case .RUSSIAN:
            return .ru
        case .UZ, .UzCyrclic:
            return .uz
        }
    }
    
    var subtitle: String {
        switch self {
        case .UZ:
            return "Iltimos, foydalanishni davom ettirish uchun tilni tanlang"
        case .RUSSIAN:
            return "Пожалуйста, выберите язык, чтобы продолжить использование"
        case .ENGLISH:
            return "Please select a language to continue using"
        case .UzCyrclic:
            return "Илтимос, фойдаланишни давом эттириш учун тилни танланг"
        }
    }
    
}
