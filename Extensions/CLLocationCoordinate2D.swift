//
//  CLLocationCoordinate2D.swift
//  AR World
//
//  Created by Nate Sesti on 12/1/18.
//  Copyright © 2018 Nate Sesti. All rights reserved.
//

import Foundation
import CoreLocation

extension CLLocationCoordinate2D: Hashable, Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.longitude == rhs.longitude &&
            lhs.latitude == rhs.latitude
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.latitude)
        hasher.combine(self.longitude)
    }
}
