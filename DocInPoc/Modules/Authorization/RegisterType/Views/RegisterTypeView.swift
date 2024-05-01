//
//  RegisterTypeView.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 01/05/24.
//

import UIKit

class RegisterTypeView: BaseView {
    let navigationBarView = NavigationBarView(leftImage: .arrowLeft)
    let contentView: RegisterTypeStackView
    
    let scrollView = UIScrollView()
    let nextButton = DiPPrimaryButton(title: "Продолжить")
    
    init(delegate: RegisterTypeStackViewDelegate){
        self.contentView = RegisterTypeStackView(delegate: delegate)
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setup() {
        backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        addSubviews(navigationBarView, scrollView, nextButton)
        scrollView.addSubview(contentView)
    }
    
    func setupConstrains() {
        
        navigationBarView.snp.makeConstraints({
            $0.left.right.top.equalToSuperview()
        })
        
        scrollView.snp.makeConstraints({
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(36)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(nextButton.snp.top)
        })
        
        nextButton.snp.makeConstraints({
            $0.left.right.equalToSuperview().inset(16)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-28)
        })
        
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalTo(self)
        }
        
    }
}
