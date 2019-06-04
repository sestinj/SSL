//
//  CGFloat.swift
//  Gravitate
//
//  Created by Nate Sesti on 6/19/18.
//  Copyright © 2018 Nate Sesti. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    init(low: CGFloat, high: CGFloat) {
        let range = high - low
        let num = arc4random_uniform(UInt32(range*1000.0))
        let final = CGFloat(num)/1000.0 + low
        self = final
    }
    static func ~(lhs: CGFloat, rhs: CGFloat) -> CGFloat {
        return CGFloat.random(in: lhs...rhs)
    }
    static func ^(lhs: CGFloat, rhs: CGFloat) -> CGFloat {
        return pow(lhs, rhs)
    }
    static func ^(lhs: CGFloat, rhs: Double) -> CGFloat {
        return pow(lhs, CGFloat(rhs))
    }
    public func simplifiedAngle() -> CGFloat {
        var angle = self
        while angle >= 2*CGFloat.pi {
            angle -= 2*CGFloat.pi
        }
        return angle
    }
    public func norm() -> CGFloat { //Normalized number (-1 or 1)
        return self/abs(self)
    }
}
