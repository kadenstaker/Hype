//
//  UIViewExtensions.swift
//  Hype
//
//  Created by Hannah Hoff on 5/3/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

extension UIView {
    
    func createShadow(with backgroundColor: UIColor, width: CGFloat, height: CGFloat, redValue: CGFloat, greenValue: CGFloat, blueValue: CGFloat, alphaValue: CGFloat, opacity: Float, radius: CGFloat) {
        
        self.layer.cornerRadius = 8
        self.backgroundColor = backgroundColor
        self.layer.shadowOffset = CGSize(width: width, height: height)
        self.layer.shadowColor = UIColor(displayP3Red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue).cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
}


