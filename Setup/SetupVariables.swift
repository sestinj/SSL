//
//  File.swift
//  Taco Tapper
//
//  Created by Nate Sesti on 6/22/18.
//  Copyright © 2018 Nate Sesti. All rights reserved.
//

import Foundation
import UIKit

let defaults = UserDefaults.standard
extension UserDefaults {
    public func addToInt(key: String, _ n: Int) {
        self.set(self.integer(forKey: key) + n, forKey: key)
    }
}
let screen = UIScreen.main.bounds
