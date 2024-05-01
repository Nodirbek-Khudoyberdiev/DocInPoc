//
//  Userdefaults + Ext.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import Foundation

extension UserDefaults {
    enum Keys {
        static let localeCode = "locale_code"
        static let languageSaved = "languageSaved"
        static let alreadyInstalled = "alreadyInstalled"
    }
}

extension UserDefaults {
    
    func setLanguageSaved(_ value: Bool) {
        setValue(value, forKey: Keys.languageSaved)
    }
    
    func getLanguageSaved() -> Bool {
        return bool(forKey: Keys.languageSaved)
    }
    
    func saveLocaleCode(languageCode: Localization) {
        setValue(languageCode.rawValue, forKey: Keys.localeCode)
        setLanguageSaved(true)
        Utils.shared.currentLanguage.onNext(languageCode)
    }
    
    
    func getLocaleCode() -> Localization {
        if let lang = string(forKey: Keys.localeCode) {
            return Localization(rawValue: lang) ?? .UZ
        }
        
        if let currentLanguage = Locale.current.languageCode {
            if currentLanguage == Localization.RUSSIAN.rawValue {
                return Localization.RUSSIAN
            }
            if currentLanguage == Localization.UZ.rawValue {
                return Localization.UZ
            }
        }
        return Localization.ENGLISH
    }
    
    func clearKeychainIfWillUnistall() {
        let freshInstall = !bool(forKey: Keys.alreadyInstalled)
        if freshInstall {
            KeychainStore.clearKeychain()
            set(true, forKey: Keys.alreadyInstalled)
        }
    }
}
