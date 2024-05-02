//
//  LanguageContentStackView.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 02/05/24.
//

import UIKit

class LanguageChooseContentStackView: UIStackView {
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
    
    private lazy var dipImageView: UIImageView = {
        let imageView = UIImageView(image: .dipLogo)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let delegate: LanguageCellDelegate?
    
    init(delegate: LanguageCellDelegate?) {
        self.delegate = delegate
        super.init(frame: .zero)
        setup()
        setupConstrains()
        build(
            axis: .vertical,
            alignment: .fill,
            distribution: .fill,
            layoutMargins: nil,
            spacing: 25,
            views: [
                dipImageView, titlesStackView
            ]
        )
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    func setup() {
        Localization.allCases.forEach({
            let view = generateTitleLabel(.mediumFont(size: $0 == .UZ ? 22 : 14), type: $0, color: $0 == .UZ ? .appDarkColor : .Gray.appGray)
            titlesStackView.addArrangedSubview(view)
        })
        addArrangedSubviews(
            dipImageView,
            titlesStackView
        )
    }
    
    func setupConstrains() {
        dipImageView.snp.makeConstraints({
            $0.width.equalTo(104)
            $0.height.equalTo(157)
        })
    }
    
    func generateTitleLabel(_ font: UIFont, type: Localization, color: UIColor) -> UILabel {
        let label = UILabel(text: type.subtitle, font: font, color: color, lines: 0, alignment: .center)
        return label
    }
}
