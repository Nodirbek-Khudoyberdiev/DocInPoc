//
//  DiPSecondaryButton.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 30/04/24.
//

import UIKit

class DiPSecondaryButton: UIButton {
    
    let title: String
    
    init(title: String){
        self.title = title
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

private extension DiPSecondaryButton {
    func setup(){
        borderColor = .appPrimaryColor
        borderWidth = 1
        borderRadius = 16
        setTitle(title, for: .normal)
        titleLabel?.font = .mediumFont(size: 16)
        setTitleColor(.appPrimaryColor, for: .normal)
        setBackgroundColor(color: .white, forState: .normal)
        setBackgroundColor(color: .Gray.selectingGray, forState: .highlighted)
        snp.makeConstraints({
            $0.height.equalTo(48)
        })
    }
}
