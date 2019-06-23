//
//  Shape.swift
//  JustGo-iOS
//
//  Created by 조우진 on 19/06/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

class TopCornerRadiusView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topLeft,.topRight], radius: 10.0)
    }
    
    override func awakeFromNib() {
        setShape()
    }
    
    func setShape(){
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        layer.shadowOffset = CGSize.init(width: 1, height: 1)
    }
}

class StepLabelShape: UILabel {
    override func awakeFromNib() {
        setShape()
    }
    
    func setShape(){
        layer.borderWidth = 1
        layer.borderColor = Color.NOTCOMPLETEDSTEP.getColor().cgColor
        self.textColor = Color.NOTCOMPLETEDSTEP.getColor()
        layer.cornerRadius = layer.frame.height / 2
    }
}
