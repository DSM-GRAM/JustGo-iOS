//
//  Color.swift
//  JustGo-iOS
//
//  Created by 조우진 on 19/06/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

enum Color{
    case NOTCOMPLETEDSTEP
    
    func getColor() -> UIColor {
        switch self {
        case .NOTCOMPLETEDSTEP: return UIColor(red: 114/255, green: 149/255, blue: 146/255, alpha: 1)
        }
    }
}
