//
//  NavigationBarButton.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 29/04/24.
//

import UIKit

final class NavigationBarButton: UIButton {
    
    static func builderButton(with image: UIImage, size: Double = 24) -> NavigationBarButton {
        let button = NavigationBarButton()
        button.setImage(image, for: .normal)
        button.tintColor = .appDarkColor
        button.snp.makeConstraints {
            $0.size.equalTo(size)
        }
        return button
    }
    
    static func builderButton(with title: String, alignment: UIControl.ContentHorizontalAlignment) -> NavigationBarButton {
        let button = NavigationBarButton()
        button.backgroundColor = .clear
        button.contentHorizontalAlignment = alignment
        button.setTitleColor(.Gray.appGray, for: .normal)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .regularFont(size: 16)
        return button
    }

}
