//
//  UIColor.swift
//  Gravitate
//
//  Created by Nate Sesti on 6/19/18.
//  Copyright © 2018 Nate Sesti. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static func ==(lhs: UIColor, rhs: UIColor) -> Bool {
        return (lhs.r() == rhs.r() && lhs.g() == rhs.g() && lhs.b() == rhs.b() && lhs.alpha() == rhs.alpha())
    }
    static func !=(lhs: UIColor, rhs: UIColor) -> Bool {
        return !(lhs==rhs)
    }
    
    convenience init(low: CGFloat, high: CGFloat) {
        let r = CGFloat(low: 0, high: CGFloat(min(1.0, high*3)))
        let g = CGFloat(low: 0, high: CGFloat(min(1.0, high*2 - r)))
        let b = high - r - g
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    convenience init(r: Int, g: Int, b: Int) {
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
    }
    
    func r() -> CGFloat {
        if cgColor.numberOfComponents == 4 {
            return cgColor.components![0]
        } else if cgColor.numberOfComponents == 2 {
            return cgColor.components![0]
        } else {
            fatalError("What is this?")
        }
    }
    func g() -> CGFloat {
        if cgColor.numberOfComponents == 4 {
            return cgColor.components![1]
        } else if cgColor.numberOfComponents == 2 {
            return cgColor.components![0]
        } else {
            fatalError("What is this?")
        }
    }
    func b() -> CGFloat {
        if cgColor.numberOfComponents == 4 {
            return cgColor.components![2]
        } else if cgColor.numberOfComponents == 2 {
            return cgColor.components![0]
        } else {
            fatalError("What is this?")
        }
    }
    func alpha() -> CGFloat {
        return self.cgColor.components![cgColor.numberOfComponents-1]
    }
    
    func brighten(percentage: CGFloat) -> UIColor {
        return UIColor(red: percentage*(1.0 - self.r()) + self.r(), green: percentage*(1.0 - self.g()) + self.g(), blue: percentage*(1.0 - self.b()) + self.b(), alpha: self.alpha())
    }
    func darken(percentage: CGFloat) -> UIColor {
        return UIColor(red: r() - percentage*r(), green: g() - percentage*g(), blue: b() - percentage*b(), alpha: self.alpha())
    }
    
    func with(grayscale avg: CGFloat) -> UIColor {
        let factor = (r() + g() + b())/3.0/avg
        if #available(iOS 10.0, *) {
            return UIColor(displayP3Red: r()*factor, green: g()*factor, blue: b()*factor, alpha: alpha())
        } else {
            // Fallback on earlier versions
            return self
        }
    }
    func withRComponent(_ r: CGFloat) -> UIColor {
        return UIColor(displayP3Red: r, green: g(), blue: b(), alpha: alpha())
    }
    func withGComponent(_ g: CGFloat) -> UIColor {
        return UIColor(displayP3Red: r(), green: g, blue: b(), alpha: alpha())
    }
    func withBComponent(_ b: CGFloat) -> UIColor {
        return UIColor(displayP3Red: r(), green: g(), blue: b, alpha: alpha())
    }
    
    func getHexCode() -> String {
        let R = Int(r()*255.0).hexFormat
        let G = Int(g()*255.0).hexFormat
        let B = Int(b()*255.0).hexFormat
        return "#\(R)\(G)\(B)"
    }
}
