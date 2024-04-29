//
//  DependencyContainer.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 27/04/24.
//

import Foundation

protocol DependencyContainerProtocol: ViewModelFactory, ViewControllerFactory, WorkerFactory {
}


final class DependencyContainer: DependencyContainerProtocol {
    
    private init() { }
    
    static let shared = DependencyContainer()
}

// MARK: ViewController DI

extension DependencyContainer {
    func languageChooseController() -> LanguageChooseViewController {
        return LanguageChooseViewController()
    }
}

// MARK: Workers DI

extension DependencyContainer {
    

}

// MARK: ViewModels DI

extension DependencyContainer {
    
   
    
}
