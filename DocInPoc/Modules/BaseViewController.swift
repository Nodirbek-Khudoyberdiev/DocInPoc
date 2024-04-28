//
//  BaseViewController.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit
import RxSwift

class BaseViewController<RootView: UIView>: UIViewController, ViewSpecificController {
    
    typealias RootView = RootView
    
    let bag = DisposeBag()
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
