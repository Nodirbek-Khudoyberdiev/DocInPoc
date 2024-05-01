//
//  OnboardingCoordinator.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 30/04/24.
//

import RxSwift
import UIKit

class OnboardingCoordinator: ReactiveCoordinator<Void> {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start(_ di: DependencyContainerProtocol) -> Observable<Void> {
        let vc = di.onboardingVC()
        vc.openAuthorization
            .subscribe(onNext: {
                let vc = AuthorizationViewController()
                self.setRootViewController(vc)
            })
            .disposed(by: disposeBag)
        navigationController.pushViewController(vc, animated: true)
        return Observable.empty()
    }
    
    
}
