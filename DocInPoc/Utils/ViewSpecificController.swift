//
//  ViewSpecificController.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit

protocol ViewSpecificController: AnyObject {
    associatedtype RootView: UIView
}

extension ViewSpecificController where Self: UIViewController {
    
    @discardableResult
    func mainView() -> RootView {
        guard let rootView = view as? RootView else {
            view = RootView()
            return mainView()
        }
        return rootView
    }
    
}
