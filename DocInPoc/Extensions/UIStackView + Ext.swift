//
//  UIStackView + Ext.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit

extension UIStackView {
    
    convenience init(
        axis: NSLayoutConstraint.Axis = .horizontal,
        distribution: UIStackView.Distribution = .fill,
        alignment: UIStackView.Alignment = .fill,
        layoutMargins: UIEdgeInsets? = nil,
        spacing: CGFloat = 0
    ) {
        self.init()
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
        if let layoutMargins = layoutMargins {
            self.layoutMargins = layoutMargins
            isLayoutMarginsRelativeArrangement = true
        }
    }
    
    func build(
        axis: NSLayoutConstraint.Axis,
        alignment: UIStackView.Alignment,
        distribution: UIStackView.Distribution,
        layoutMargins: UIEdgeInsets? = nil,
        spacing: CGFloat,
        views: [UIView]? = nil
    ) {
        views?.forEach { addArrangedSubview($0) }
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        if let layoutMargins = layoutMargins {
            self.layoutMargins = layoutMargins
            isLayoutMarginsRelativeArrangement = true
        }
    }
    
}

