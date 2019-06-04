//
//  Selector.swift
//  Notes
//
//  Created by Nate Sesti on 1/21/19.
//  Copyright © 2019 Nate Sesti. All rights reserved.
//

import Foundation
extension Selector {
    func call(target: Any) {
        let _ = Timer.scheduledTimer(timeInterval: 0.0, target: target, selector: self, userInfo: nil, repeats: false)
    }
}
