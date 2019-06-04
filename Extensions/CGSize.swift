//
//  CGSize.swift
//  Gravitate
//
//  Created by Nate Sesti on 6/19/18.
//  Copyright © 2018 Nate Sesti. All rights reserved.
//

import Foundation
import UIKit

extension CGSize {
    init(_ size: Int) {
        self.init(width: size, height: size)
    }
    
    static func *(lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width*rhs, height: lhs.height*rhs)
    }
    static func /(lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width/rhs, height: lhs.height/rhs)
    }
    static func /(lhs: CGSize, rhs: Int) -> CGSize {
        return CGSize(width: lhs.width/CGFloat(rhs), height: lhs.height/CGFloat(rhs))
    }
    
    func toPoint() -> CGPoint {
        return CGPoint(x: self.width, y: self.height)
    }
    func toVector() -> CGVector {
        return CGVector(dx: self.width, dy: self.height)
    }
}
