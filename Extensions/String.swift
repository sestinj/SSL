//
//  String.swift
//  AR World
//
//  Created by Nate Sesti on 6/3/19.
//  Copyright © 2019 Nate Sesti. All rights reserved.
//

import Foundation

extension String {
    public func removing(_ characterSet: CharacterSet) -> String {
        return self.components(separatedBy: characterSet).joined()
    }
}
