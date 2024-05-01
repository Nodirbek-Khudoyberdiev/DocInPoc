//
//  AuthorizationView.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 30/04/24.
//

import UIKit

class AuthorizationView: BaseView {
    
    enum AuthorizationViewConstants {
        static let inset: CGFloat = 32
    }
    
    let countryButton = LanguageButton()
    
    private lazy var dipImageView: UIImageView = {
        let imageView = UIImageView(image: .dipLogo)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel(
            text: "Авторизоваться",
            font: .boldFont(size: 28),
            color: .appPrimaryColor,
            lines: 1,
            alignment: .center
        )
        return label
    }()
    
    private let detailsLabel: UILabel = {
        let label = UILabel(
            text: "Войдите в систему, чтобы пользоваться всеми возможностями, и будьте здоровы!",
            font: .mediumFont(size: 16),
            color: .appDarkColor,
            lines: 0,
            alignment: .center
        )
        return label
    }()
    
    let loginButton = DiPPrimaryButton(title: "Войти")
    let registerButton = DiPSecondaryButton(title: "Регистрироваться")
    
    private let buttonsStackView = UIStackView(
        axis: .vertical,
        distribution: .fillEqually,
        alignment: .fill,
        layoutMargins: nil,
        spacing: 16
    )
    
    
    func setup() {
        addSubviews(countryButton, dipImageView, titleLabel, detailsLabel, buttonsStackView)
        buttonsStackView.addArrangedSubview(loginButton)
        buttonsStackView.addArrangedSubview(registerButton)
    }
    
    func setupConstrains() {
        
        countryButton.snp.makeConstraints({
            $0.right.equalToSuperview().inset(17)
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(13)
        })
        
        dipImageView.snp.makeConstraints({
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(36)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(104)
            $0.height.equalTo(157)
        })
        
        titleLabel.snp.makeConstraints({
            $0.top.equalTo(dipImageView.snp.bottom).offset(AuthorizationViewConstants.inset)
            $0.left.right.equalToSuperview().inset(AuthorizationViewConstants.inset)
        })
        
        detailsLabel.snp.makeConstraints({
            $0.left.right.equalToSuperview().inset(AuthorizationViewConstants.inset)
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
        })
        
        buttonsStackView.snp.makeConstraints({
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-28)
            $0.left.right.equalToSuperview().inset(16)
        })
        
        
    }
    
    func reload() {
        let localCode = UserDefaults.standard.getLocaleCode()
        countryButton.setCountryData(with: localCode)
    }
}

class LanguageButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let text = UserDefaults.standard.getLocaleCode().title
        let image = UserDefaults.standard.getLocaleCode().image
        titleLabel?.font = .regularFont(size: 16)
        setTitleColor(.appDarkColor, for: .normal)
        setImage(image, for: .normal)
        setTitle(text, for: .normal)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
        
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    func setCountryData(with localization: Localization){
        setImage(localization.image, for: .normal)
        setTitle(localization.title, for: .normal)
        
    }
    
}
