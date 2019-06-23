//
//  LoginViewModel.swift
//  JustGo-iOS
//
//  Created by 조우진 on 16/05/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel: ViewModelType {
    struct Input{
        let mainShow: Signal<Void>
    }
    
    struct Output{
        let mainShowDone: BehaviorRelay<Bool>
    }
    
    func transform(input: MainViewModel.Input) -> MainViewModel.Output {
        let mainShowDone = BehaviorRelay<Bool>(value: false)
        
        input.mainShow.asObservable()
            .subscribe(onNext: { _ in
                if mainShowDone.value == false { mainShowDone.accept(true) }
                else { mainShowDone.accept(false) }
            })

//        let mainShowDone = input.mainShow
//        .asObservable()
//        .map { return true }
//        .asDriver(onErrorJustReturn: false)
        
        return Output(mainShowDone: mainShowDone)
    }
    
}
