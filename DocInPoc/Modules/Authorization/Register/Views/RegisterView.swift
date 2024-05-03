//
//  RegisterView.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 02/05/24.
//

import UIKit

class RegisterView: BaseView {
    
    let navigationBar = NavigationBarView.defaultNavigationbar(title: "Регистрация")
    let contentStackView = RegisterContentStackView()
    let scrollView = UIScrollView()
    
    func setup() {
        scrollView.showsVerticalScrollIndicator = false
        addSubviews(navigationBar, scrollView)
        scrollView.addSubview(contentStackView)
    }
    
    func setupConstrains() {
        navigationBar.snp.makeConstraints({
            $0.top.left.right.equalToSuperview()
        })

        scrollView.snp.makeConstraints({
            $0.top.equalTo(navigationBar.snp.bottom).offset(24)
            $0.left.right.bottom.equalToSuperview()
        })
        
        contentStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalTo(self).inset(16)
        }
    }
    
}


