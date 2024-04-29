//
//  DiPButton.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit

class DiPButton: UIButton {
    
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

private extension DiPButton {
    
    func setup(){
        backgroundColor = .appPrimaryColor
        setTitle(title, for: .normal)
        titleLabel?.font = .mediumFont(size: 16)
        
        snp.makeConstraints({
            $0.height.equalTo(48)
        })
        
    }
    
}

// MARK: DiPButtonViaImage

class DiPButtonViaImage: UIButton {
    
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

private extension DiPButtonViaImage {
    
    func setup(){
        backgroundColor = .appPrimaryColor
        tintColor = .white
        setImage(.arrowRight.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        
        snp.makeConstraints({
            $0.size.equalTo(56)
        })
        
    }
    
}
