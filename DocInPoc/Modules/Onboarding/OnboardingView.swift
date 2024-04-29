//
//  OnboardingView.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit

class OnboardingView: BaseView {
    
    let navigationBar: NavigationBarView = {
        let navigationBarView = NavigationBarView(rightTitle: "Пропустить")
        return navigationBarView
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = true        
        return collectionView
    }()
    
    let bottomInfoView = OnboardingBottomInfoView()
    
    func setup() {
        addSubviews(collectionView, navigationBar, bottomInfoView)
    }
    
    func setupConstrains() {
        
        collectionView.snp.makeConstraints({
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(bottomInfoView.snp.bottom)
        })
        
        navigationBar.snp.makeConstraints({
            $0.left.right.top.equalToSuperview()
        })
        
        bottomInfoView.snp.makeConstraints({
            $0.bottom.left.right.equalToSuperview()
            $0.height.equalTo(262)
        })
    }
}

class OnboardingBottomInfoView: BaseView {
    
    
    let stepView = StepsView(numberOfSteps: 3)
    
    private let titleLabel: UILabel = {
        let label = UILabel(font: .boldFont(size: 22),
                            color: .appDarkColor,
                            lines: 3)
        return label
    }()
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    let nextButton = DiPButtonViaImage(image: .arrowRight)
    
    func setup() {
        backgroundColor = UIColor(hex: "F5F7FF")
        addSubviews(
            titleLabel,
            nextButton,
            stepView
        )
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(
            corners: [.topLeft, .topRight],
            radius: 24
        )
    }
    
    func setupConstrains() {
        titleLabel.snp.makeConstraints({
            $0.left.right.equalToSuperview().inset(24)
            $0.top.equalTo(32)
            $0.height.equalTo(90)
        })
        
        nextButton.snp.makeConstraints({
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.right.equalToSuperview().inset(24)
        })
        
        stepView.snp.makeConstraints({
            $0.centerY.equalTo(nextButton.snp.centerY)
            $0.left.equalTo(24)
            $0.height.equalTo(4)
        })
        
    }
    
}

class StepsView: BaseView {
    
    var selectedStep: Int = 0 {
        didSet {
            hStackView.arrangedSubviews.forEach({
                $0.backgroundColor = selectedStep == $0.tag ? .appPrimaryColor : .appPrimaryColor.withAlphaComponent(0.3)
            })
        }
    }
    
    private let hStackView = UIStackView(
        axis: .horizontal,
        distribution: .fillEqually,
        alignment: .fill,
        layoutMargins: .none,
        spacing: 4
    )
    
    private let numberOfSteps: Int
    
    init(numberOfSteps: Int){
        self.numberOfSteps = numberOfSteps
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setup() {
        for index in 0..<numberOfSteps {
            let stepView = createStepView()
            stepView.tag = index
            stepView.backgroundColor = index == 0 ? .appPrimaryColor : .appPrimaryColor.withAlphaComponent(0.3)
            hStackView.addArrangedSubview(stepView)
        }
        addSubview(hStackView)
    }
    
    func setupConstrains() {
        hStackView.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
    }
    
    private func createStepView() -> UIView {
        let view = UIView()
        view.backgroundColor = .appPrimaryColor.withAlphaComponent(0.3)
        view.cornerRadius = 2
        view.clipsToBounds = true
        view.snp.makeConstraints({
            $0.height.equalTo(4)
            $0.width.equalTo(12)
        })
        return view
    }
    
}
