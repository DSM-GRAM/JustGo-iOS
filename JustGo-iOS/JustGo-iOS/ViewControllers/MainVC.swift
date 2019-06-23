//
//  ViewController.swift
//  JustGo-iOS
//
//  Created by 조우진 on 16/05/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainVC: UIViewController {
    @IBOutlet weak var mainShowButton: UIButton!
    @IBOutlet weak var mainView: UIStackView!
    @IBOutlet weak var mainContainerView: UIView!
    
    var isFirst = false
    var viewModel: MainViewModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    
}

extension MainVC {
    func bindViewModel(){
        viewModel = MainViewModel()
        
        let input = MainViewModel.Input(mainShow: mainShowButton.rx.tap.asSignal())
        let output = viewModel.transform(input: input)
        
        output.mainShowDone.asObservable()
            .subscribe(onNext: { [weak self] isSuccess in
                guard let `self` = self else { return }
                if isSuccess{
                    self.isFirst = true
                    
                    UIView.animate(withDuration: 0.3, animations: {
                        self.mainView.transform = CGAffineTransform(translationX: 0.0, y: -150.0)
                        self.mainContainerView.frame = CGRect(x: 0, y: 0, width: 375, height: self.mainContainerView.frame.height * 1.2)
                    })
                }
                    
                else {
                    if self.isFirst{
                        UIView.animate(withDuration: 0.3, animations: {
                            self.mainView.transform = CGAffineTransform(translationX: 0.0, y: 150.0)
                            self.mainContainerView.frame = CGRect(x: 0, y: 0, width: 375, height: self.mainContainerView.frame.height * 0.8)
                        })
                    }
                }
            })
            .disposed(by: disposeBag)
    }
}

