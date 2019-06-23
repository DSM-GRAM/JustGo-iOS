//
//  Base.swift
//  JustGo-iOS
//
//  Created by 조우진 on 16/05/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
