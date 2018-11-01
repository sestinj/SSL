//
//  SKPhysicsContact.swift
//  Rocket
//
//  Created by Nate Sesti on 10/31/18.
//  Copyright © 2018 Nate Sesti. All rights reserved.
//

import Foundation
import SpriteKit

extension SKPhysicsContact {
    func getNodes(a: String, b: String) -> (SKNode, SKNode)? {
        //If the contact contains both a and b, return the nodes in order (a, b). Otherwise, return nil to signify that some other node was in the contact.
        guard let node1 = bodyA.node, let node2 = bodyB.node else {return nil}
        guard let name1 = node1.name, let name2 = node2.name else {return nil}
        
        if name1 == a {
            if name2 == b {
                return (node1, node2)
            } else {return nil}
        } else if name2 == a {
            if name1 == b {
                return (node2, node1)
            } else {return nil}
        } else {return nil}
    }
}
