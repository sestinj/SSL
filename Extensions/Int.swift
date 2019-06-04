//
//  Int.swift
//  Taco Tapper
//
//  Created by Nate Sesti on 6/25/18.
//  Copyright © 2018 Nate Sesti. All rights reserved.
//

import Foundation

extension Int {
    static func **(lhs: Int, rhs: Int) -> Int {
        return Int(pow(Double(lhs), Double(rhs)))
    }
    
    static func ~(lhs: Int, rhs: Int) -> Int {
        return Int.random(in: lhs...rhs)
    }
    
    static prefix func !(rhs: Int) -> Int {
        //So Ints can be treated as Bools with the ! operator
        //0 = false, all else = true
        //0 -> 1, all else -> 0
        if rhs == 0 {
            return 1
        } else {
            return 0
        }
    }
    static postfix func ++(lhs: Int) -> Int {
        return lhs + 1
    }
    static postfix func --(lhs: Int) -> Int {
        return lhs - 1
    }
    static func %=(lhs: Int, rhs: Int) -> Bool {
        return lhs % rhs == 0
    }
    public var kFormat: String {
        //Thousand->K, Million->M, Billion->B, etc...
        let suffixes = ["","K","M","B","T","Q","QQ","S","SS","O","N","D"]
        var temp = Double(self)
        var idx = 0
        while temp >= 1000 {
            temp /= 1000
            idx += 1
        }
        if temp - temp.rounded() == 0 {
            //Return 10K instead of 10.0K
            return String(Int(temp)) + suffixes[idx]
        } else {
            return String((temp*10).rounded()/10.0) + suffixes[idx]
        }
    }
    
    public var hexFormat: String {
        var str = ""
        var x = self
        if x < 16 {
            var str = ""
            switch x {
            case 10:
                str = "A"
            case 11:
                str = "B"
            case 12:
                str = "C"
            case 13:
                str = "D"
            case 14:
                str = "E"
            case 15:
                str = "F"
            default:
                str = String(x)
            }
            return str
        }
        let max = Int(log(Double(x))/log(16.0) + 1.0)
        for i in 0...max {
            let n = x % 16^(max-i)
            str += n.hexFormat
            x -= n
        }
        return str
    }
}
