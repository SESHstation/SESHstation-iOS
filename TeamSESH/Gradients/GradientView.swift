//
//  Gradient.swift
//  TeamSESH
//
//  Created by Dalgat Alibekov on 8/22/20.
//  Copyright © 2020 dalgat alibekov. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    var centerColor: UIColor = #colorLiteral(red: 0.1254901961, green: 0.03529411765, blue: 0.1098039216, alpha: 1)
    var topColor: UIColor = #colorLiteral(red: 0.07058823529, green: 0.1843137255, blue: 0.1960784314, alpha: 1)
    var bottomColor: UIColor = #colorLiteral(red: 0.01960784314, green: 0.03137254902, blue: 0.0431372549, alpha: 1)
    
    var startPointX: CGFloat = 0
    var startPointY: CGFloat = 0
    var endPointX: CGFloat = 1
    var endPointY: CGFloat = 1

    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [centerColor.cgColor, topColor.cgColor, bottomColor.cgColor] 
        gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
        gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
