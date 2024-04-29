//
//  OnboardingViewController.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture

struct OnboardingVM {
    let title: String
    let image: UIImage
}

class OnboardingViewController: BaseViewController<OnboardingView> {
    
    private let onboardingVM: [OnboardingVM] = [
        .init(title: "Ищите опытных специалистов.", image: .firstOnb),
        .init(title: "Все врачи-специалисты Страны в одном месте.", image: .secondOnb),
        .init(title: "Присоединяйтесь к нашей онлайн-консультации, и все врачи станут вашими врачами.", image: .thirdOnb)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupActions()
        addGestureForBottomView()
        setBottomInfo(at: 0)
    }
    
    override func loadView() {
        super.loadView()
        view = mainView()
    }
    
}

// MARK: UISetup

private extension OnboardingViewController {
    func setupCollectionView(){
        mainView().collectionView.delegate = self
        mainView().collectionView.dataSource = self
    }
    
    func setupActions(){
        mainView().bottomInfoView.nextButton
            .rx
            .tap
            .subscribe(onNext: {[weak self] _ in
                guard let self else { return }
                self.swipeCell(direction: .left)
            })
            .disposed(by: bag)
    }
    
    func addGestureForBottomView(){
        mainView().bottomInfoView
            .rx
            .swipeGesture([.left, .right])
            .subscribe(onNext: {[weak self] swipe in
                self?.swipeCell(direction: swipe.direction)
            })
            .disposed(by: bag)
    }
    
    func swipeCell(direction: UISwipeGestureRecognizer.Direction){
        guard let visibleIndex = Utils.shared.getVisibleCell(for: mainView().collectionView) else { return }
        let nextIndex = direction == .left ? visibleIndex.row + 1 : visibleIndex.row - 1
        if nextIndex != onboardingVM.count || nextIndex < 0 {
            let nextIndexPath = IndexPath(row: nextIndex, section: 0)
            mainView().collectionView.isPagingEnabled = false
            mainView().collectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
            mainView().collectionView.isPagingEnabled = true
            setBottomInfo(at: nextIndex)
        }
    }
    
    func setBottomInfo(at index: Int){
        mainView().bottomInfoView.title = onboardingVM[safe: index]?.title ?? ""
        mainView().bottomInfoView.stepView.selectedStep = index
    }
}

extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingVM.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: OnboardingCell = collectionView.dequeueCell(for: indexPath)
        cell.setup(with: onboardingVM[indexPath.item].image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let visibleCell = Utils.shared.getVisibleCell(for: mainView().collectionView) else { return }
        setBottomInfo(at: visibleCell.row)
    }
}
