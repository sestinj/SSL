//
//  Taptics.swift
//  Taco Tapper
//
//  Created by Nate Sesti on 6/23/18.
//  Copyright © 2018 Nate Sesti. All rights reserved.
//

import Foundation
import GameplayKit


@available(iOS 10.0, *)
func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
    let feedback = UIImpactFeedbackGenerator(style: style)
    feedback.impactOccurred()
}

@available(iOS 10.0, *)
extension UIImpactFeedbackGenerator {
    @available(iOS 10.0, *)
    static func impactSequence(times: [Double], style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let styles = Array.init(repeating: style, count: times.count)
        impactSequence(times: times, styles: styles)
    }
    
    static func impactSequence(times: [Double], styles: [UIImpactFeedbackGenerator.FeedbackStyle]) {
        for i in 0..<times.count {
            let time = times[i]
            switch styles[i] {
            case .light:
                let _ = Timer.scheduledTimer(timeInterval: time, target: self, selector: #selector(lightImpact), userInfo: nil, repeats: false)
            case .medium:
                let _ = Timer.scheduledTimer(timeInterval: time, target: self, selector: #selector(mediumImpact), userInfo: nil, repeats: false)
            default:
                let _ = Timer.scheduledTimer(timeInterval: time, target: self, selector: #selector(heavyImpact), userInfo: nil, repeats: false)
            }
        }
    }
    
    static func impactSequence(interval: Double, repetitions: Int, style: UIImpactFeedbackGenerator.FeedbackStyle) {
        var times = [Double]()
        for i in 0..<repetitions {
            times.append(Double(i)*interval)
        }
        impactSequence(times: times, style: style)
    }
    
    @objc static func lightImpact() {
        impact(style: .light)
    }
    @objc static func mediumImpact() {
        impact(style: .medium)
    }
    @objc static func heavyImpact() {
        impact(style: .heavy)
    }
}

extension UIButton {
    @objc fileprivate func impact() {
        if #available(iOS 10.0, *) {
            let feedback = UIImpactFeedbackGenerator(style: impactStyle)
            feedback.impactOccurred()
        }
    }
    @available(iOS 10.0, *)
    func causesImpact(_ ofStyle: UIImpactFeedbackGenerator.FeedbackStyle) {
        //Causes an impact
        impactStyle = ofStyle
        self.addTarget(self, action: #selector(impact), for: .touchUpInside)
    }
}
@available(iOS 10.0, *)
fileprivate var impactStyle: UIImpactFeedbackGenerator.FeedbackStyle = UIImpactFeedbackGenerator.FeedbackStyle.light
