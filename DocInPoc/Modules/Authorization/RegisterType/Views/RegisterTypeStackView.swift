//
//  RegisterTypeStackView.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 02/05/24.
//

import UIKit

protocol RegisterTypeStackViewDelegate: AnyObject {
    func didSelectCategory(type: RegisterType)
}

class RegisterTypeStackView: UIStackView {
    
    private lazy var dipImageView: UIImageView = {
        let imageView = UIImageView(image: .dipLogo)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel(
            text: "Давайте начнем!",
            font: .boldFont(size: 28),
            color: .appPrimaryColor,
            lines: 1,
            alignment: .center
        )
        return label
    }()
    
    private let detailsLabel: UILabel = {
        let label = UILabel(
            text: "Выберите тип пользователя для использования приложения",
            font: .mediumFont(size: 16),
            color: .appDarkColor,
            lines: 0,
            alignment: .center
        )
        return label
    }()
    
    let typeStackView = UIStackView(
        axis: .horizontal,
        distribution: .fillEqually,
        alignment: .fill,
        layoutMargins: nil,
        spacing: 9
    )
    
    private let delegate: RegisterTypeStackViewDelegate
    init(delegate: RegisterTypeStackViewDelegate){
        self.delegate = delegate
        super.init(frame: .zero)
        let margins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        build(axis: .vertical, alignment: .fill, distribution: .fill, layoutMargins: margins, spacing: 0)
        setup()
        setupConstrains()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    func setup() {
        RegisterType.allCases.forEach({
            let view = RegisterTypeCategoryView(type: $0)
            view.isSelected = $0 == .client
            view.delegate = delegate
            typeStackView.addArrangedSubview(view)
        })
        addArrangedSubview(dipImageView)
        addArrangedSubview(titleLabel)
        addArrangedSubview(detailsLabel)
        addArrangedSubview(typeStackView)
        
        setCustomSpacing(32, after: dipImageView)
        setCustomSpacing(24, after: titleLabel)
        setCustomSpacing(59, after: detailsLabel)
        setCustomSpacing(45, after: typeStackView)
    }
    
    func setupConstrains() {
        dipImageView.snp.makeConstraints({
            $0.width.equalTo(104)
            $0.height.equalTo(157)
        })
    }
    
}


