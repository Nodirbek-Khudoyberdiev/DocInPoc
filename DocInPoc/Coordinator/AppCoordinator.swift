//
//  AppCoordinator.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 27/04/24.
//

import RxSwift

class AppCoordinator: ReactiveCoordinator<Void> {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start(_ di: DependencyContainerProtocol) -> Observable<Void> {
        navigationController.setViewControllers([LanguageChooseViewController()], animated: false)
        return Observable.never()
    }

}

