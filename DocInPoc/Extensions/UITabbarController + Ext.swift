//
//  UITabbarController + Ext.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import UIKit

extension UITabBarController {
    
    func createNav(with title: String, image: UIImage?, selectedImge: UIImage?, vc: UIViewController) -> UINavigationController {
        let navVC = UINavigationController(rootViewController: vc)
        navVC.tabBarItem.title = title
        navVC.tabBarItem.selectedImage = selectedImge
        navVC.tabBarItem.image = image
        return navVC
    }
    
}
