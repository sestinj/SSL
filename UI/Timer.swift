//
//  Timer.swift
//  Taco Tapper
//
//  Created by Nate Sesti on 12/29/18.
//  Copyright © 2018 Nate Sesti. All rights reserved.
//

import Foundation
import UIKit

class TimerLabel: UILabel {
    private var timer: Timer!
    private var time: TimeInterval!
    private var updateInterval: TimeInterval!
    private let startDate = Date()
    init(frame: CGRect, startTime: TimeInterval, _ updateInterval: TimeInterval) {
        super.init(frame: frame)
        
        self.time = startTime
        self.updateInterval = updateInterval
        timer = Timer.scheduledTimer(timeInterval: updateInterval, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTimer() {
        time += updateInterval
        self.text = time.timeString
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
