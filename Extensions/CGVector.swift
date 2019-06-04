//
//  CGVector.swift
//  Taco Tapper
//
//  Created by Nate Sesti on 6/24/18.
//  Copyright © 2018 Nate Sesti. All rights reserved.
//

import Foundation
import UIKit

extension CGVector {
    init(from: CGPoint, to: CGPoint, multiplier: CGFloat) {
        let dx = to.x - from.x
        let dy = to.y - from.y
        self.init(dx: dx*multiplier, dy: dy*multiplier)
    }
    
    static func *(lhs: CGVector, rhs: CGFloat) -> CGVector {
        return CGVector(dx: lhs.dx*rhs, dy: lhs.dy*rhs)
    }
    
    func toPoint() -> CGPoint {
        return CGPoint(x: self.dx, y: self.dy)
    }
    func toSize() -> CGSize {
        return CGSize(width: self.dx, height: self.dy)
    }
    func magnitude() -> CGFloat {
        return CGFloat(sqrt(Double(dx*dx + dy*dy)))
    }
    
    func rotated(by angle: CGFloat) -> CGVector {
        let theta = atan(dy/dx)
        let h = self.magnitude()
        return CGVector(dx: h*cos(theta), dy: h*sin(theta))
    }
}
