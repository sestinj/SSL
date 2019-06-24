//
//  CALayer.swift
//  Taco Tapper
//This is a cal
//  Created by Nate Sesti on 6/22/18.
//  Copyright © 2018 Nate Sesti. All rights reserved.
//

import Foundation
import UIKit

fileprivate var isFlipping = false
extension CALayer {
    func animate(_ keyPath: String, from: Any, duration: Double, autoreverses: Bool = false, timingFunction: CAMediaTimingFunctionName? = nil, _ completion: (() -> Void)? = nil) {
        let animation = CABasicAnimation(keyPath: keyPath)
        animation.fromValue = from
        animation.toValue = self.value(forKey: keyPath)
        animation.duration = duration
        animation.autoreverses = autoreverses
        animation.timingFunction = CAMediaTimingFunction(name: timingFunction ?? CAMediaTimingFunctionName(rawValue: "linear"))
        if let completion = completion {
            let _ = Timer(timeInterval: duration, repeats: autoreverses) { (_) in
                completion()
            }
        }
        
        self.add(animation, forKey: keyPath)
    }
    
    
    func flipAnimation(_ timeInterval: TimeInterval) {
        guard !isFlipping else {return}
        let temp = transform
        transform = CATransform3DRotate(transform, CGFloat.pi, 0.0, 1.0, 0.0)
        animate(#keyPath(CALayer.transform), from: temp, duration: timeInterval)
        
        
        let _ = Timer.scheduledTimer(timeInterval: timeInterval/2.0, target: self, selector: #selector(flipAllContents), userInfo: nil, repeats: false)
    }
    
    @objc func flipAllContents() {
        if let subs = sublayers {
            for sub in subs {
                sub.transform = CATransform3DRotate(sub.transform, CGFloat.pi, 0.0, 1.0, 0.0)
            }
        }
    }
    
    func roundCorners() {
        cornerRadius = min(frame.width, frame.height)/2
        masksToBounds = true
    }
    
    func addShadowLayer(_ offset: CGFloat) -> CAShapeLayer {
        guard let sup = self.superlayer else {fatalError("Must add layer to superlayer before adding shadow layer.")}
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = CGPath(roundedRect: self.frame, cornerWidth: self.cornerRadius, cornerHeight: self.cornerRadius, transform: nil)
        shadowLayer.fillColor = self.backgroundColor
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOffset = CGSize(width: offset, height: offset)
        shadowLayer.shadowRadius = offset
        shadowLayer.shadowOpacity = 1.0
        sup.addSublayer(shadowLayer)
        //Remove and re-add layer to its superlayer so that it has the same zposition as the shadow, but is on top
        removeFromSuperlayer()
        sup.addSublayer(self)
        return shadowLayer
    }
    
    func addShadow(_ offset: CGFloat, color: UIColor) {
        shadowOpacity = 1.0
        masksToBounds = false
        shadowRadius = offset
        shadowOffset = CGSize(Int(offset))
        shadowColor = color.cgColor
    }
    
    func addCircularBorder(color: UIColor, lineWidth: CGFloat) -> CAShapeLayer {
        let circle = CAShapeLayer()
        circle.path = UIBezierPath(ovalIn: bounds).cgPath
        circle.strokeColor = color.cgColor
        circle.fillColor = UIColor.clear.cgColor
        circle.lineWidth = lineWidth
        addSublayer(circle)
        return circle
    }
    
    func gradiate(color: UIColor) {
        let gradLayer = CAGradientLayer()
        gradLayer.colors = [color.cgColor, color.brighten(percentage: 0.85).cgColor]
        gradLayer.frame = frame
        gradLayer.name = "gradLayer"
        gradLayer.startPoint = CGPoint.zero
        gradLayer.endPoint = CGPoint.one
        gradLayer.zPosition = -100
        addSublayer(gradLayer)
    }
    
    func alphaGradiate(color: UIColor) {
        let gradLayer = CAGradientLayer()
        gradLayer.colors = [color.cgColor, UIColor.clear.cgColor]
        gradLayer.frame = frame
        gradLayer.name = "gradLayer"
        gradLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        addSublayer(gradLayer)
    }
    
    func addHoles(paths: [UIBezierPath]) {
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.fillColor = UIColor.black.cgColor
        let path1 = UIBezierPath(rect: bounds)
        for path in paths {
            path1.append(path)
        }
        maskLayer.path = path1.cgPath
        maskLayer.fillRule = CAShapeLayerFillRule.evenOdd
        mask = maskLayer
    }
    @objc func remove() {
        removeFromSuperlayer()
    }
}
