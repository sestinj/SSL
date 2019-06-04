//
//  NTimer.swift
//  Notes
//
//  Created by Nate Sesti on 1/21/19.
//  Copyright © 2019 Nate Sesti. All rights reserved.
//

import Foundation
import UIKit
class NTimer: NSObject {
    //A timer that repeats a specific number of times
    private var n: Int = 0
    private var repetitions: Int
    private var selector: Selector
    private var completion: (() -> Void)?
    private var target: Any
    private var timer: Timer!
    init(interval: TimeInterval, target: Any, selector: Selector, repetitions: Int) {
        self.completion = nil
        self.repetitions = repetitions
        self.selector = selector
        self.target = target
        super.init()
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(fired), userInfo: nil, repeats: true)
    }
    init(interval: TimeInterval, target: Any, selector: Selector, repetitions: Int, completion: @escaping () -> Void) {
        self.repetitions = repetitions
        self.selector = selector
        self.completion = completion
        self.target = target
        super.init()
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(fired), userInfo: nil, repeats: true)
    }
    @objc func fired() {
        n += 1
        selector.call(target: target)
        if n >= repetitions {
            timer.invalidate()
            if let completion = completion {
                completion()
            }
        }
    }
}
