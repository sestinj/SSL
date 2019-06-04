//
//  Double.swift
//  Taco Tapper
//
//  Created by Nate Sesti on 6/25/18.
//  Copyright © 2018 Nate Sesti. All rights reserved.
//

import Foundation

extension Double {
    static func ^(lhs: Double, rhs: Double) -> Double {
        return pow(lhs, rhs)
    }
    init(bool: Bool) {
        if bool {
            self = 1.0
        } else {
            self = 0.0
        }
    }
    static func ~(lhs: Double, rhs: Double) -> Double {
        return Double.random(in: lhs...rhs)
    }
    static func random() -> Double {
        //Returns random from 0.0..<1.0
        return Double.random(in: 0.0..<1.0)
    }
    public var kFormat: String {
        //Thousand->K, Million->M, Billion->B, etc...
        let suffixes = ["","K","M","B","T","Q","QQ","S","SS","O","N","D"]
        var temp = self.rounded()
        var idx = 0
        while temp >= 1000 {
            temp /= 1000
            idx += 1
        }
        if (temp*10.0).rounded()/10.0 - temp.rounded() == 0 {
            //Return 10K instead of 10.0K
            return String(Int(temp)) + suffixes[idx]
        } else {
            return String((temp*10.0).rounded()/10.0) + suffixes[idx]
        }
    }
}
