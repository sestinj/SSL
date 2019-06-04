//
//  RatingAccessoryViewController.swift
//  AR World
//
//  Created by Nate Sesti on 12/5/18.
//  Copyright © 2018 Nate Sesti. All rights reserved.
//

import UIKit

class RatingAccessoryViewController: UIViewController {

    private var stars = [UIButton]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.frame = CGRect(x: 0, y: 0, width: 250, height: 50)
        // Do any additional setup after loading the view.
        for i in 0..<5 {
            let button = UIButton(frame: CGRect(x: 5 + i*40, y: 5, width: 40, height: 40))
            button.setTitle(nil, for: .normal)
            
            let star = CAShapeLayer()
            let path = CGMutablePath()
            path.addLines(between: [
                CGPoint(x: 20, y: 40),
                CGPoint(x: 25, y: 30),
                CGPoint(x: 35, y: 30),
                CGPoint(x: 25, y: 15),
                CGPoint(x: 35, y: 10),
                CGPoint(x: 20, y: 15),
                CGPoint(x: 5, y: 10),
                CGPoint(x: 15, y: 15),
                CGPoint(x: 5, y: 30),
                CGPoint(x: 15, y: 30),
                ])
            star.path = path
            star.borderColor = UIColor.blue.cgColor
            star.fillColor = UIColor.clear.cgColor
            star.lineJoin = CAShapeLayerLineJoin.bevel
            
            button.layer.addSublayer(star)
            view.addSubview(button)
            stars.append(button)
        }
    }
}
