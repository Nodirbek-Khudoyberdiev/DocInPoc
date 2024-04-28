//
//  LanguageChooseViewController.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 27/04/24.
//

import UIKit
import RxSwift

class LanguageChooseViewController: BaseViewController<LanguageChooseView> {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    override func loadView() {
        super.loadView()
        view = mainView()
    }

}

