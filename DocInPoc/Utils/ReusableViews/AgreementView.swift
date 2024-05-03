//
//  AgreementView.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 02/05/24.
//

import UIKit
import RxRelay

class AgreementView: BaseView {
    
    lazy var checkBoxButton: UIButton = {
        let button = UIButton()
        button.borderRadius = 8
        button.borderWidth = 1
        button.borderColor = .appBorderColor
        return button
    }()
    
    private let agreementLabel = UILabel(
        font: .regularFont(size: 14),
        color: .appDarkColor,
        lines: 0,
        alignment: .left
    )
    
    let agreementText: String
    let isSelectedPublisher = BehaviorRelay<Bool>(value: false)
    private var isSelected = false
    
    init(agreementText: String, hightlitedParts: [String]){
        self.agreementText = agreementText
        super.init(frame: .zero)
        agreementLabel.text = agreementText
        agreementLabel.highlight(searchedText: hightlitedParts, color: .appPrimaryColor, font: .regularFont(size: 14))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setup() {
        checkBoxButton.addTarget(self, action: #selector(didTapCheckbox), for: .touchUpInside)
        addSubviews(checkBoxButton, agreementLabel)
    }
    
    func setupConstrains() {
        checkBoxButton.snp.makeConstraints({
            $0.left.equalToSuperview()
            $0.top.equalToSuperview()
            $0.size.equalTo(24)
        })
        
        agreementLabel.snp.makeConstraints({
            $0.left.equalTo(checkBoxButton.snp.right).offset(12)
            $0.right.equalToSuperview()
            $0.top.equalTo(checkBoxButton.snp.top)
            $0.bottom.equalToSuperview()
        })
    }
    
    @objc func didTapCheckbox(){
        isSelected.toggle()
        checkBoxButton.setImage(isSelected ? .checkmarkDP : nil, for: .normal)
        checkBoxButton.borderColor = isSelected ? .clear : .appBorderColor
        isSelectedPublisher.accept(isSelected)
    }
}

