//
//  RegisterViewController.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 02/05/24.
//

import UIKit

class RegisterViewController: BaseViewController<RegisterView> {
    
    let viewModel: RegisterViewModelProtocol
    
    init(viewModel: RegisterViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bindRegisterButton()
    }
    
    override func loadView() {
        super.loadView()
        view = mainView()
    }
    
}

private extension RegisterViewController {
    func setup(){
        mainView().navigationBar.onLeftButton = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        mainView().contentStackView.agreementView.isSelectedPublisher
            .bind(to: viewModel.agreementChecked)
            .disposed(by: bag)
    }
    
    func bindRegisterButton(){
        viewModel.isEnabled
            .bind(to: mainView().contentStackView.registerButton.rx.isEnabled)
            .disposed(by: bag)
            
    }
}
