//
//  RegisterTypeViewController.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 01/05/24.
//

import UIKit

class RegisterTypeViewController: BaseViewController<RegisterTypeView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func loadView() {
        super.loadView()
        view = RegisterTypeView(delegate: self)
    }

}

private extension RegisterTypeViewController {
    func setup(){
        mainView().navigationBarView.onLeftButton = {[weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
}

extension RegisterTypeViewController: RegisterTypeStackViewDelegate {
    func didSelectCategory(type: RegisterType) {
        mainView().contentView.typeStackView
            .arrangedSubviews
            .compactMap({
                $0 as? RegisterTypeCategoryView
            })
            .forEach({
                $0.isSelected = $0.type == type
            })
    }
}