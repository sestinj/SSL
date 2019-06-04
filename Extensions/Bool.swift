//
//  Bool.swift
//  RandBool
//
//  Created by Nate Sesti on 1/15/19.
//  Copyright © 2019 Nate Sesti. All rights reserved.
//

import Foundation
import CoreGraphics

extension Bool {
    static func random() -> Bool {
        return random(probTrue: 0.5)
    }
    static func random(probTrue: Double) -> Bool {
        if Double.random(in: 0...1) < probTrue {
            return true
        } else {
            return false
        }
    }
    public var int: Int {
        if self {
            return 1
        } else {return 0}
    }
    public var cgFloat: CGFloat {
        if self {
            return 1.0
        } else {return 0.0}
    }
}
