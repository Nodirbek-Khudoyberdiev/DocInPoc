//
//  RegisterType.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 02/05/24.
//

import UIKit

enum RegisterType: CaseIterable {
    case client
    case doctor
    
    var title: String {
        switch self {
        case .doctor:
            return "Мед. Специалист"
        case .client:
            return "Пользователь"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .doctor:
            return .doctorType
        case .client:
            return .clientType
        }
    }
    
}
