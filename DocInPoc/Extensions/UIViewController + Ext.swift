//
//  UIViewController + Ext.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit

extension UIViewController {
    
    func addChildVC(_ vc: UIViewController){
        self.addChild(vc)
        self.didMove(toParent: vc)
    }
    
}

extension UIViewController {

    /**
     *  Height of status bar + navigation bar (if navigation bar exist)
     */

    var topbarHeight: CGFloat {
        return (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
}
