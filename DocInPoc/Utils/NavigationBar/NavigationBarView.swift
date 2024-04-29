//
//  NavigationBarView.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 29/04/24.
//

import UIKit

typealias VoidBlock = () -> Void

final class NavigationBarView: UIView {
    
    // MARK: - Private properties

    private let statusBarView = UIView()
    private let navigationBarView = UIView()

    private let titleLabel: UILabel = {
        let label = UILabel(font: .boldFont(size: 18),
                            color: .appDarkColor,
                            lines: 1,
                            alignment: .center)
        label.lineBreakMode = .byTruncatingTail
        label.clipsToBounds = true
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    

    private(set) var leftButton: NavigationBarButton?
    private(set) var rightButton: NavigationBarButton?
    
    // MARK: - Public properties
    
    var title: String?
    var onLeftButton: VoidBlock?
    var onRightButton: VoidBlock?
    var leftRightInset: CGFloat?

    convenience init(
        title: String = "",
        leftImage: UIImage? = nil,
        rightImage: UIImage? = nil
    ){
        self.init(frame: .zero)
        self.title = title
        if let leftImage {
            leftButton = NavigationBarButton.builderButton(with: leftImage)
        }
        if let rightImage {
            rightButton = NavigationBarButton.builderButton(with: rightImage)
        }
        setupNavigationBar()
    }
    
    convenience init(
        title: String = "",
        leftTitle: String? = nil,
        rightTitle: String? = nil
    ){
        self.init(frame: .zero)
        self.title = title
        if let leftTitle {
            leftButton = NavigationBarButton.builderButton(with: leftTitle, alignment: .left)
        }
        if let rightTitle {
            rightButton = NavigationBarButton.builderButton(with: rightTitle, alignment: .right)
        }
        setupNavigationBar()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}

// MARK: - Private

private extension NavigationBarView {
    
    enum NavigationConstants {
        static let height = 56
        static let inset = 16
    }
    
    func setupNavigationBar() {
        backgroundColor = .clear

        addSubview(statusBarView)
        statusBarView.backgroundColor = .clear

        statusBarView.snp.makeConstraints {
            $0.left.right.top.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.top)
        }
        
        addSubview(navigationBarView)
        navigationBarView.backgroundColor = .clear
                
        navigationBarView.snp.makeConstraints {
            $0.top.equalTo(statusBarView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
            $0.height.equalTo(NavigationConstants.height)
        }
        titleLabel.text = title
        navigationBarView.addSubview(titleLabel)
        
        
        
        if let leftButton {
            navigationBarView.addSubview(leftButton)
            leftButton.addTarget(self, action: #selector(onLeftAction), for: .touchUpInside)
            leftButton.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.left.equalToSuperview().offset(NavigationConstants.inset)
            }
        }
        if let rightButton {
            navigationBarView.addSubview(rightButton)
            rightButton.addTarget(self, action: #selector(onRightAction), for: .touchUpInside)
            rightButton.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.right.equalToSuperview().inset(NavigationConstants.inset)
            }
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(NavigationConstants.inset)
            $0.left.equalTo(leftButton != nil ? leftButton!.snp.right : self).offset(NavigationConstants.inset)
            $0.right.equalTo(rightButton != nil ? rightButton!.snp.left : self).offset(-NavigationConstants.inset)
        }

    }
    
    @objc func onLeftAction() {
        onLeftButton?()
    }
    
    @objc func onRightAction() {
        onRightButton?()
    }
    
}


