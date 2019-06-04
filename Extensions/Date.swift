//
//  Date.swift
//  POH
//
//  Created by Nate Sesti on 1/17/19.
//  Copyright © 2019 Nate Sesti. All rights reserved.
//

import Foundation

extension Date {
    public var uniqueDay: DateComponents {
        return Calendar.current.dateComponents([.day, .month, .year], from: self)
    }
    public var day: Int? {
        return Calendar.current.dateComponents([.day], from: self).day
    }
    public var month: Int? {
        return Calendar.current.dateComponents([.month], from: self).month
    }
    public var year: Int? {
        return Calendar.current.dateComponents([.year], from: self).year
    }
    public var monthName: String? {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: now)
    }
}

@available(iOS 10.0, *)
extension DateInterval {
    public var days: Int? {
        return Calendar.current.dateComponents([.day], from: start, to: end).day
    }
    public var months: Int? {
        return Calendar.current.dateComponents([.month], from: start, to: end).month
    }
    public var years: Int? {
        return Calendar.current.dateComponents([.year], from: start, to: end).year
    }
    public var weeks: Int? {
        return Calendar.current.dateComponents([.weekOfYear], from: start, to: end).weekOfYear
    }
}
