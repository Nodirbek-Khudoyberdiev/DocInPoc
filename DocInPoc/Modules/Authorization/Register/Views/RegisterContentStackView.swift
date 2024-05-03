//
//  RegisterContentStackView.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 02/05/24.
//

import UIKit

class RegisterContentStackView: UIStackView {
    
    let loginTextField = DiPPrimaryTextField(type: .phone)
    let usernameTextField = DiPPrimaryTextField(type: .username)
    let passwordTextField = DiPPrimaryTextField(type: .password)
    let passwordRepeatTextField = DiPPrimaryTextField(type: .password)
    let registerButton = DiPPrimaryButton(title: "Регистрироваться")
    let agreementView = AgreementView(
        agreementText: "Я согласен с условиями предоставляемыми услугами и политикой конфиденциальности",
        hightlitedParts: [
            "предоставляемыми услугами",
            "политикой конфиденциальности"
        ]
    )
    let loginButton: UILabel = {
        let label = UILabel(
            text: "У вас нет аккаунта?\n Войти",
            font: .regularFont(size: 16),
            color: .Gray.appGray,
            lines: 2,
            alignment: .center
        )
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        build(
            axis: .vertical,
            alignment: .fill,
            distribution: .fill,
            spacing: 16
        )
        addArrangedSubviews(
            loginTextField,
            usernameTextField,
            passwordTextField,
            passwordRepeatTextField,
            agreementView,
            registerButton,
            loginButton
        )
        setCustomSpacing(24, after: passwordRepeatTextField)
        setCustomSpacing(24, after: agreementView)
        setCustomSpacing(32, after: registerButton)
        loginButton.highlight(searchedText: ["Войти"], color: .appPrimaryColor, font: .mediumFont(size: 16))
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
