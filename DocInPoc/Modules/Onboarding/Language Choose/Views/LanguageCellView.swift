//
//  LanguageCellView.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit

protocol LanguageCellDelegate: AnyObject {
    func didSelect(type: Localization)
}

class LanguageCellView: BaseView {
    
    weak var delegate: LanguageCellDelegate?
    
    var touchesBegin: UIColor? {
        return .Gray.selectingGray
    }
    
    var touchesEnd: UIColor? {
        return .white
    }
    
    var isSelectionEnabled: Bool = true
    var type: Localization?
    
    private lazy var arrowRightImageView = UIImageView.defaultImageView()
    private lazy var titleLabel: UILabel = {
        let label = UILabel(
            font: .mediumFont(size: 16),
            color: .appDarkColor,
            lines: 1,
            alignment: .left
        )
        return label
    }()
    private lazy var bottomLineView = UIView()
    
    func setup() {
        bottomLineView.backgroundColor = UIColor(hex: "E5E7EB")
        arrowRightImageView.image = .arrowRight
        addSubviews(titleLabel, arrowRightImageView, bottomLineView)
    }
    
    func setupConstrains() {
        addTapGesture(tapNumber: 1, target: self, action: #selector(didSelectCell))
        snp.makeConstraints({
            $0.height.equalTo(61)
        })
        
        titleLabel.snp.makeConstraints({
            $0.left.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        })
        
        arrowRightImageView.snp.makeConstraints({
            $0.right.equalToSuperview().inset(16)
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.size.equalTo(24)
        })
        
        bottomLineView.snp.makeConstraints({
            $0.bottom.equalToSuperview()
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(1)
        })
    }
    
    func buildCell(with type: Localization){
        self.type = type
        titleLabel.text = type.title
    }
    
    @objc func didSelectCell(){
        delegate?.didSelect(type: type!)
    }
    
}
