//
//  LanguageChooseViewController.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 27/04/24.
//

import UIKit
import RxSwift

class LanguageChooseViewController: BaseViewController<LanguageChooseView> {

    let languageSelected = PublishSubject<Void>()
    
    override func loadView() {
        super.loadView()
        view = LanguageChooseView(delegate: self)
    }

}


extension LanguageChooseViewController: LanguageCellDelegate {
    func didSelect(type: Localization) {
        UserDefaults.standard.saveLocaleCode(languageCode: type)
        languageSelected.onNext(())
    }
}
