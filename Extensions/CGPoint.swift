//
//  CGPoint.swift
//  Gravitate
//
//  Created by Nate Sesti on 6/19/18.
//  Copyright © 2018 Nate Sesti. All rights reserved.
//

import Foundation
import UIKit

extension CGPoint {
    static let one = CGPoint(x: 1.0, y: 1.0)
    static let mid = CGPoint(x: 0.5, y: 0.5)
    
    init(inside: CGRect) {
        let xPos = CGFloat(low: inside.minX, high: inside.maxX)
        let yPos = CGFloat(low: inside.minY, high: inside.maxY)
        self.init(x: xPos, y: yPos)
    }
    static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    static func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    static func +(lhs: CGPoint, rhs: CGVector) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.dx, y: lhs.y + rhs.dy)
    }
    static func -(lhs: CGPoint, rhs: CGVector) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.dx, y: lhs.y - rhs.dy)
    }
    static func +(lhs: CGVector, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.dx + rhs.x, y: lhs.dy + rhs.y)
    }
    static func -(lhs: CGVector, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.dx - rhs.x, y: lhs.dy - rhs.y)
    }
    static func *(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x*rhs, y: lhs.y*rhs)
    }
    
    static func +-(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x + rhs, y: lhs.y)
    }
    
    static func +|(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x, y: lhs.y + rhs)
    }
    
    static func *-(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x * rhs, y: lhs.y)
    }
    
    static func *|(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x, y: lhs.y * rhs)
    }
    
    static func *(lhs: CGPoint, rhs: Int) -> CGPoint {
        return CGPoint(x: lhs.x*CGFloat(rhs), y: lhs.y*CGFloat(rhs))
    }
    
    static func +-(lhs: CGPoint, rhs: Int) -> CGPoint {
        return CGPoint(x: lhs.x + CGFloat(rhs), y: lhs.y)
    }
    
    static func +|(lhs: CGPoint, rhs: Int) -> CGPoint {
        return CGPoint(x: lhs.x, y: lhs.y + CGFloat(rhs))
    }
    
    static func *-(lhs: CGPoint, rhs: Int) -> CGPoint {
        return CGPoint(x: lhs.x * CGFloat(rhs), y: lhs.y)
    }
    
    static func *|(lhs: CGPoint, rhs: Int) -> CGPoint {
        return CGPoint(x: lhs.x, y: lhs.y * CGFloat(rhs))
    }
    
    func toVector() -> CGVector {
        return CGVector(dx: self.x, dy: self.y)
    }
    func toSize() -> CGSize {
        return CGSize(width: self.x, height: self.y)
    }
    
    func rotated(by angle: CGFloat, about point: CGPoint) -> CGPoint {
        let a = x - point.x
        let o = y - point.y
        let h = sqrt(a*a + o*o)
        var theta = atan(o/a)
        if a < 0 && o > 0 {
            theta *= -1
        } else if a < 0 && o < 0 {
            theta *= -1
        }
        theta += angle
        return CGPoint(x: h*cos(theta), y: h*sin(theta))
    }
    ///Defaults to rotation about origin.
    func rotated(by angle: CGFloat) -> CGPoint {
        return self.rotated(by: angle, about: CGPoint.zero)
    }
    ///Returns the angle of elevation from the given point to this point.
    func angle(from point: CGPoint) -> CGFloat {
        let o = y - point.y
        let a = x - point.x
        let theta = atan(o/a)
        return theta
    }
}

