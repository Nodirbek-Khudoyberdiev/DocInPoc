//
//  LanguageChooseCoordinator.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit
import RxSwift

class LanguageChooseCoordinator: ReactiveCoordinator<Void> {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start(_ di: DependencyContainerProtocol) -> Observable<Void> {
        let vc = di.languageChooseController()
        vc.languageSelected
            .flatMap({
                self.openOnboarding()
            })
            .subscribe()
            .disposed(by: disposeBag)
        navigationController.pushViewController(vc, animated: true)
        return Observable.empty()
    }
    
    private func openOnboarding() -> Observable<Void> {
        let onboardingCoordinator = OnboardingCoordinator(navigationController: navigationController)
        return coordinate(to: onboardingCoordinator)
    }
    
}
