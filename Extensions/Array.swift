//
//  Array.swift
//  FaceControlled
//
//  Created by Nate Sesti on 7/17/18.
//  Copyright © 2018 Nate Sesti. All rights reserved.
//

import Foundation

extension Array {
    func random() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        let array = self
        return array[index]
    }
}
extension Array where Element: Equatable {
    mutating func removeAll(_ element: Element) {
        self.removeAll { (e) -> Bool in
            e == element
        }
    }
    static func -(lhs: Array, rhs: Array) -> Array {
        var new = lhs
        for element in lhs {
            if rhs.contains(element) {
                new.removeAll(element)
            }
        }
        return new
    }
    static func +(lhs: Array, rhs: Array) -> Array {
        var new = lhs
        new.append(contentsOf: rhs)
        return new
    }
    func removingDuplicates() -> [Element] {
        var tempArray = self
        var new = [Element]()
        for _ in 0..<count{
            let tempElement = tempArray.remove(at: 0)
            tempArray.removeAll(tempElement)
            new.append(tempElement)
        }
        return new
    }
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
