//
//  UITextView.swift
//  AR World
//
//  Created by Nate Sesti on 12/2/18.
//  Copyright © 2018 Nate Sesti. All rights reserved.
//

import Foundation
import UIKit


fileprivate var viewVC: UIViewController!
extension UIView {
    func movesUpWithKeyboard(vc: UIViewController) {
        viewVC = vc
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateTextView(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateTextView(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    func shrinksWithKeyboard(vc: UIViewController) {
        viewVC = vc
        NotificationCenter.default.addObserver(self, selector: #selector(self.shrinkTextView(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.shrinkTextView(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    enum gradientType {
        case vertical
        case horizontal
        case cross
    }
    
    func applyGradient(colors:[UIColor], type: gradientType) -> CAGradientLayer {
        var endPoint: CGPoint!
        switch (type) {
        case .horizontal:
            endPoint = CGPoint(x: 1, y: 0)
        case .vertical:
            endPoint = CGPoint(x: 0, y: 1)
        case .cross:
            endPoint = CGPoint(x: 1, y: 1)
        }
        self.layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors.map{ $0.cgColor}
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = endPoint
        gradientLayer.zPosition = self.layer.zPosition - 0.01
        
        //self.layer.addSublayer(gradientLayer)
        
        self.layer.insertSublayer(gradientLayer, at: 0)
        
        return gradientLayer
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    @objc func updateTextView(notification: Notification)
    {
        if let userInfo = notification.userInfo
        {
            let keyboardFrameScreenCoordinates = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            
            let keyboardFrame = self.convert(keyboardFrameScreenCoordinates, to: viewVC.view.window)
            
            var height = keyboardFrame.height
            if X() {
                height -= 44
            }
            
            if notification.name == UIResponder.keyboardWillHideNotification{
                self.frame.origin.y += 2*height
            }
            else{
                self.frame.origin.y -= height
            }
        }
    }
    @objc func shrinkTextView(notification: Notification)
    {
        if let userInfo = notification.userInfo
        {
            let keyboardFrameScreenCoordinates = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            
            let keyboardFrame = self.convert(keyboardFrameScreenCoordinates, to: viewVC.view.window)
            
            let height = keyboardFrame.height
//            if X() {
//                height -= 44
//            }
            
            if notification.name == UIResponder.keyboardWillHideNotification{
                self.frame.size.height += 2*height
            }
            else{
                self.frame.size.height -= height
            }
        }
    }
}
