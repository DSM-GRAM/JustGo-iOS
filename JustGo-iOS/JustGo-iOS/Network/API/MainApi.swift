//
//  MainAPI.swift
//  JustGo-iOS
//
//  Created by 조우진 on 19/06/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation

enum MainApi: API{
    case tourlist, navigation
    
    func getPath() -> String {
        switch self {
        case .tourlist: return "/travel/tour-list"
        case .navigation: return "/travel/direction"
        }
    }
    
}
