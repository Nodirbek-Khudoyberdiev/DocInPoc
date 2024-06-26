//
//  ObservableType + Ext.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import RxSwift

extension ObservableType {
    
    func subscribeOnMain() -> Observable<Element> {
        Observable.create { observer in
            let disposable = SingleAssignmentDisposable()
            DispatchQueue.main.async {
                disposable.setDisposable(self.subscribe(observer))
            }
            return disposable
        }
    }
    
    func observeOnMain() -> Observable<Element> {
            Observable.create { observer in
                self.subscribe { event in
                    DispatchQueue.main.async {
                        observer.on(event)
                    }
                }
            }
        }
}


