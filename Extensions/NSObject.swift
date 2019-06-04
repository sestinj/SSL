//
//  NSObject.swift
//  MYOA
//
//  Created by Nate Sesti on 5/25/19.
//  Copyright © 2019 Nate Sesti. All rights reserved.
//

import Foundation

extension NSObject {
    static func getPropertyNames() -> [String] {
        var count = UInt32()
        let classToInspect = self
        let properties : UnsafeMutablePointer <objc_property_t> = class_copyPropertyList(classToInspect, &count)!
        var propertyNames = [String]()
        let intCount = Int(count)
        for i in 0..<intCount {
            let property : objc_property_t = properties[i]
            guard let propertyName = NSString(utf8String: property_getName(property)) as String? else {
                debugPrint("Couldn't unwrap property name for \(property)")
                break
            }
            
            propertyNames.append(propertyName)
        }
        free(properties)
        return propertyNames
    }
}
