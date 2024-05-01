//
//  RegisterTypeCategoryView.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 02/05/24.
//

import UIKit

class RegisterTypeCategoryView: BaseView {
    private let choosenImageView = UIImageView.defaultImageView()
    private let imageView = UIImageView.defaultImageView()
    
    weak var delegate: RegisterTypeStackViewDelegate?
    
    private lazy var titleLabel = UILabel(
        text: type.title,
        font: .mediumFont(size: 16),
        color: .appDarkColor,
        lines: 1,
        alignment: .center
    )
    
    private let choosenLabel = UILabel(
        font: .regularFont(size: 12),
        color: .Gray.appGray,
        lines: 1,
        alignment: .center
    )
    
    let type: RegisterType
    
    var isSelected: Bool = false {
        didSet {
            reload()
        }
    }
    
    init(type: RegisterType){
        self.type = type
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setup() {
        reload()
        backgroundColor = .white
        borderRadius = 16
        borderWidth = 1
        imageView.image = type.image
        addTapGesture(tapNumber: 1, target: self, action: #selector(didTapSelf))
        addSubviews(choosenImageView, imageView, choosenLabel, titleLabel)
    }
    
    func setupConstrains() {
        snp.makeConstraints({
            $0.height.equalTo(175)
        })
        
        choosenImageView.snp.makeConstraints({
            $0.left.top.equalToSuperview().inset(8)
            $0.size.equalTo(24)
        })
        
        imageView.snp.makeConstraints({
            $0.height.equalTo(105)
            $0.width.equalTo(96)
            $0.top.equalTo(12)
            $0.centerX.equalToSuperview()
        })
        
        titleLabel.snp.makeConstraints({
            $0.top.equalTo(imageView.snp.bottom).offset(12)
            $0.left.right.equalToSuperview().inset(10)
        })
        
        choosenLabel.snp.makeConstraints({
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.left.right.equalToSuperview().inset(10)
        })
    }
    
    func reload() {
        choosenImageView.isHidden = !isSelected
        choosenImageView.image = .tickCheckMark
        choosenLabel.text = isSelected ? "Выбрано" : "Выбирать"
        borderColor = isSelected ? .appPrimaryColor : .appBorderColor
    }
    
    @objc func didTapSelf(){
        delegate?.didSelectCategory(type: type)
    }
    
}
