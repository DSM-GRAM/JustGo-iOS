//
//  ViewModelType.swift
//  JustGo-iOS
//
//  Created by 조우진 on 19/06/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
