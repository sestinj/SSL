//
//  TimeInterval.swift
//  Taco Tapper
//
//  Created by Nate Sesti on 1/4/19.
//  Copyright © 2019 Nate Sesti. All rights reserved.
//

import Foundation


extension TimeInterval {
    public var timeString: String {
        let hours = Int(self) / 3600
        let minutes = Int(self) / 60 % 60
        let seconds = Int(self) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}
