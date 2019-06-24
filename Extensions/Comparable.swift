//
//  Comparable.swift
//  AR World
//
//  Created by Nate Sesti on 6/23/19.
//  Copyright © 2019 Nate Sesti. All rights reserved.
//

import Foundation

extension Comparable {
    func bounded<T>(_ minimum: T, _ maximum: T) -> T where T: Comparable {
        let a = max(minimum, self as! T)
        let b = min(a, maximum)
        return b
    }
}
