//
//  LanguageChooseView.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit
import SnapKit

final class LanguageChooseView: BaseView {
    
    let delegate: LanguageCellDelegate?
    let scrollView = UIScrollView()
    lazy var contentStackView = LanguageChooseContentStackView(delegate: delegate)
    
    private lazy var languagesStackView: UIStackView = {
        let stackView = UIStackView(
            axis: .vertical,
            distribution: .fillEqually,
            alignment: .fill,
            layoutMargins: nil,
            spacing: 0
        )
        return stackView
    }()
    
    init(delegate: LanguageCellDelegate?) {
        self.delegate = delegate
        super.init(frame: .zero)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    func setup() {
        Localization.allCases.forEach({
            let cell = LanguageCellView()
            cell.buildCell(with: $0)
            cell.delegate = delegate
            languagesStackView.addArrangedSubview(cell)
        })
        
        scrollView.showsVerticalScrollIndicator = false
        addSubviews(scrollView, languagesStackView)
        scrollView.addSubview(contentStackView)
        
    }
    
    func setupConstrains() {
        scrollView.snp.makeConstraints({
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(36)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(languagesStackView.snp.top)
        })
        
        contentStackView.snp.makeConstraints({
            $0.left.right.equalTo(self).inset(16)
            $0.top.bottom.equalToSuperview()
        })
        
        languagesStackView.snp.makeConstraints({
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-12)
            $0.left.right.equalToSuperview()
        })
    }
    
}


