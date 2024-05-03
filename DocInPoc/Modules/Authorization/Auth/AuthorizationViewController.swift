//
//  AuthorizationViewController.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 30/04/24.
//

import UIKit
import RxSwift
import RxGesture
import RxRelay

class AuthorizationViewController: BaseViewController<AuthorizationView> {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLanguage()
        didSelectLanguage()
    }
    
    override func loadView() {
        super.loadView()
        view = mainView()
    }
    
}

private extension AuthorizationViewController {
    func setupLanguage(){
        currentLanguage
            .subscribe(onNext: {[weak self] _ in
                self?.mainView().reload()
            })
            .disposed(by: bag)
        mainView().registerButton
            .rx
            .tap
            .subscribe(onNext: {
                let vc = RegisterTypeViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: bag)
    }
    
    func didSelectLanguage(){
        var actions: [UIAction] = []
        Localization.allCases.forEach({ lang in
            let action = UIAction(title: lang.title, image: lang.image) { _ in
                UserDefaults.standard.saveLocaleCode(languageCode: lang)
            }
            actions.append(action)
        })
        
        let menu = UIMenu(
            children: actions
        )
        mainView().countryButton.showsMenuAsPrimaryAction = true
        mainView().countryButton.menu = menu
    }
}
