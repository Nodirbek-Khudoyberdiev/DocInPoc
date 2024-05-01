//
//  BaseViewController.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit
import RxSwift
import RxRelay

class BaseViewController<RootView: UIView>: UIViewController, ViewSpecificController {
    
    typealias RootView = RootView
    
    let currentLanguage = PublishSubject<Localization?>()
    
    let bag = DisposeBag()
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeToCurrentLanguage()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func subscribeToCurrentLanguage(){
        Utils.shared.currentLanguage
            .bind(to: currentLanguage)
            .disposed(by: bag)
    }
    
}
