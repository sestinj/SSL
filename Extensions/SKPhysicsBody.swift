//
//  SKPhysicsBody.swift
//  XO 8aLl 8La5t3r
//
//  Created by Nate Sesti on 1/11/19.
//  Copyright © 2019 Nate Sesti. All rights reserved.
//

import Foundation
import SpriteKit

extension SKPhysicsBody {
    public var kineticEnergy: CGFloat {
        return 0.5*mass*CGFloat(velocity.magnitude()^2.0)
    }
    public var momentum: CGFloat {
        return mass*CGFloat(velocity.magnitude())
    }
}
