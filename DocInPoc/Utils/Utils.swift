//
//  Utils.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 29/04/24.
//

import UIKit
import RxSwift
import RxRelay

class Utils {
    
    let currentLanguage = BehaviorSubject<Localization?>(value: nil)
    
    static let shared = Utils()
    
    private init(){
        
    }
    
    func getVisibleCell(for collectionView: UICollectionView) -> IndexPath? {
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint)
        return visibleIndexPath
    }

}
