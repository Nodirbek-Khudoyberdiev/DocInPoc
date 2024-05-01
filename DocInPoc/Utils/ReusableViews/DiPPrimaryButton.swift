//
//  DiPPrimaryButton.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit

class DiPPrimaryButton: UIButton {
    
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

private extension DiPPrimaryButton {
    
    func setup(){
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .mediumFont(size: 16)
        borderRadius = 16
        setBackgroundColor(color: .appPrimaryColor, forState: .normal)
        setBackgroundColor(color: .appPrimaryColor.withAlphaComponent(0.6), forState: .highlighted)
        setBackgroundColor(color: .appPrimaryColor.withAlphaComponent(0.6), forState: .disabled)
        snp.makeConstraints({
            $0.height.equalTo(48)
        })
        
    }
    
}

// MARK: DiPButtonViaImage

class DiPPrimaryButtonViaImage: UIButton {
    
    let image: UIImage?
    
    init(image: UIImage?){
        self.image = image
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cornerRadius = self.bounds.width / 2
    }
    
    
}

private extension DiPPrimaryButtonViaImage {
    
    func setup(){
        backgroundColor = .appPrimaryColor
        tintColor = .white
        setImage(.arrowRight.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        
        snp.makeConstraints({
            $0.size.equalTo(56)
        })
        
    }
    
}
