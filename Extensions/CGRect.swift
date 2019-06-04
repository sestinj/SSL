//
//  CGRect.swift
//  Gravitate
//
//  Created by Nate Sesti on 6/19/18.
//  Copyright © 2018 Nate Sesti. All rights reserved.
//

import Foundation
import UIKit

extension CGRect {
    func max() -> CGPoint {
        return CGPoint(x: maxX, y: maxY)
    }
    func mid() -> CGPoint {
        return CGPoint(x: midX, y: midY)
    }
    func min() -> CGPoint {
        return CGPoint(x: minX, y: minY)
    }
    func centerOnPoint(point: CGPoint) -> CGRect {
        return CGRect(x: point.x - width/2.0, y: point.y - height/2.0, width: width, height: height)
    }
    init(width: CGFloat, height: CGFloat, centerOn: CGPoint) {
        self.init(x: centerOn.x - 0.5*width, y: centerOn.y - 0.5*height, width: width, height: height)
    }
    func corners() -> [CGPoint] {
        // 1=topleft, 2=topright, 3=bottomleft, 4=bottomright
        return [CGPoint(x: self.minX, y: self.minY), CGPoint(x: self.maxX, y: self.minY), CGPoint(x: self.minX, y: self.maxY), CGPoint(x: self.maxX, y: self.maxY)]
    }
    
    static func +(lhs: CGRect, rhs: CGSize) -> CGRect {
        return CGRect(x: lhs.origin.x, y: lhs.origin.y, width: lhs.width + rhs.width, height: lhs.height + rhs.width)
    }
    static func +(lhs: CGRect, rhs: CGPoint) -> CGRect {
        return CGRect(x: lhs.origin.x + rhs.x, y: lhs.origin.y + rhs.y, width: lhs.width, height: lhs.height)
    }
    
    enum ScaleType {
        //Which corner stays is adynamic
        case center, bottomLeft, topLeft, bottomRight, topRight
    }
    func scale(by: CGFloat, type: ScaleType) -> CGRect {
        let newSize = self.size*by
        var rect = CGRect(origin: self.origin, size: newSize)
        switch type {
        case .center:
            rect.origin.x -= 0.5*((by-1.0)*self.size.width)
            rect.origin.y -= 0.5*((by-1.0)*self.size.height)
        case .bottomLeft:
            let _: Double;
        case .topLeft:
            let _: Any;
        case .bottomRight:
            let _: Any;
        case .topRight:
            let _: Any;
        }
        return rect
    }
}
