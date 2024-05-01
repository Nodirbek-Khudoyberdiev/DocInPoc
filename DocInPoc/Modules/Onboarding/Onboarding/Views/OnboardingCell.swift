//
//  OnboardingCell.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit

class OnboardingCell: BaseCollectionCell {
    
    let personImageView = UIImageView.defaultImageView()
    
    func setup() {
        contentView.addSubview(personImageView)
    }
    
    func setupConstrains() {
        personImageView.snp.makeConstraints({
            $0.left.right.equalToSuperview().inset(32)
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
        })
    }
    
    func setup(with image: UIImage?){
        personImageView.image = image
    }
    
}
