//
//  LanguageChooseView.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit
import SnapKit

final class LanguageChooseView: BaseView {
    
    enum LanguageChoose {
        case uz
        case ru
        case eng
        
        var title: String {
            switch self {
            case .uz:
                return "Iltimos, foydalanishni davom ettirish uchun tilni tanlang"
            case .ru:
                return "Пожалуйста, выберите язык, чтобы продолжить использование"
            case .eng:
                return "Please select a language to continue using"
            }
        }
    }
    
    private lazy var titlesStackView: UIStackView = {
        let stackView = UIStackView(
            axis: .vertical,
            distribution: .fill,
            alignment: .fill,
            layoutMargins: nil,
            spacing: 12
        )
        return stackView
    }()
    
    private lazy var languagesStackView: UIStackView = {
        let stackView = UIStackView(
            axis: .vertical,
            distribution: .fillEqually,
            alignment: .fill,
            layoutMargins: nil,
            spacing: 0
        )
        return stackView
    }()
    
    private lazy var dipImageView: UIImageView = {
        let imageView = UIImageView(image: .dipLogo)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    func setup() {
        let uzTitle = generateTitleLabel(.mediumFont(size: 22), type: .uz, color: .appDarkColor)
        let engTitle = generateTitleLabel(.mediumFont(size: 14), type: .eng, color: .Gray.appGray)
        let ruTitle = generateTitleLabel(.mediumFont(size: 14), type: .ru, color: .Gray.appGray)
        [uzTitle, engTitle, ruTitle].forEach({
            titlesStackView.addArrangedSubview($0)
        })
        
        [Localization.UZ, Localization.ENGLISH, Localization.RUSSIAN].forEach({
            let cell = LanguageCellView()
            cell.buildCell(with: $0)
            languagesStackView.addArrangedSubview(cell)
        })
        
        addSubviews(
            dipImageView,
            titlesStackView,
            languagesStackView
        )
    }
    
    func setupConstrains() {
        dipImageView.snp.makeConstraints({
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(56)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(104)
            $0.height.equalTo(157)
        })
        
        titlesStackView.snp.makeConstraints({
            $0.top.equalTo(dipImageView.snp.bottom).offset(25)
            $0.left.right.equalToSuperview().inset(16)
        })
        
        languagesStackView.snp.makeConstraints({
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(12)
            $0.left.right.equalToSuperview()
        })
    }
    
    func generateTitleLabel(_ font: UIFont, type: LanguageChoose, color: UIColor) -> UILabel {
        let label = UILabel(text: type.title, font: font, color: color, lines: 0, alignment: .center)
        return label
    }
    
}

