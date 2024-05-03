//
//  RegisterViewModel.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 02/05/24.
//

import RxSwift
import RxRelay

protocol RegisterViewModelProtocol {
    var isEnabled: Observable<Bool> { get }
    var agreementChecked: BehaviorRelay<Bool> { get }
}

class RegisterViewModel: RegisterViewModelProtocol {
    
    var agreementChecked = BehaviorRelay<Bool>(value: false)
    
    var isEnabled: Observable<Bool> {
        return agreementChecked.asObservable()
    }
    
}


