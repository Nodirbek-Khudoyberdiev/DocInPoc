//
//  ViewControllerFactory.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 27/04/24.
//

import Foundation

protocol ViewControllerFactory {
    func onboardingVC() -> OnboardingViewController
    func languageChooseController() -> LanguageChooseViewController
}
