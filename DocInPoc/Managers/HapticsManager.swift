//
//  HapticsManager.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 02/05/24.
//

import UIKit

class HapticsManager {
    static let shared = HapticsManager()
    
    private init(){}
    
    // MARK: - Public
    
    public func vibrateForSelection(){
        let generator = UISelectionFeedbackGenerator()
        generator.prepare()
        generator.selectionChanged()
    }
    
    // Vibrate for type
    public func vibrate(for type: UINotificationFeedbackGenerator.FeedbackType){
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(type)
    }
    
}
