//
//  UINavigationBar.swift
//  RandBool
//
//  Created by Nate Sesti on 1/18/19.
//  Copyright © 2019 Nate Sesti. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar {
    func applyGradientImage(colors: [UIColor], type: UIView.gradientType) {
        var endPoint: CGPoint!
        switch (type) {
        case .horizontal:
            endPoint = CGPoint(x: 1, y: 0)
        case .vertical:
            endPoint = CGPoint(x: 0, y: 1)
        case .cross:
            endPoint = CGPoint(x: 1, y: 1)
        }
        var bound: CGRect!
        if X() {
            bound = CGRect(x: bounds.origin.x, y: bounds.origin.y-44, width: bounds.width, height: bounds.height+44)
        } else {
            bound = bounds
        }
        self.layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bound
        gradientLayer.colors = colors.map{ $0.cgColor}
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = endPoint
        
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        setBackgroundImage(image, for: .default)
    }
}
