//
//  UIImageView + Ext.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit

extension UIImageView {
    static func defaultImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
}
