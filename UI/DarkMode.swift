//
//  DarkMode.swift
//  POH
//
//  Created by Nate Sesti on 1/13/19.
//  Copyright © 2019 Nate Sesti. All rights reserved.
//

import Foundation
import UIKit


//DEPRECATED: DON"T USE UNTIL FIXED!
extension UIView {
    fileprivate func darkMode() {
        //Darken UITableViewCell.contentView
        UIView.appearance(whenContainedInInstancesOf: [UITableViewCell.self]).backgroundColor = .darkGray
        
        //Only invert the background view of plain UIViews (not UILabels, etc...)
        let noChangeBackground: [UIView.Type] = [UILabel.self]
        let t = type(of: self)
        if !noChangeBackground.contains(where: { (type) -> Bool in
            return type == t
        }) {
            backgroundColor = backgroundColor?.darkModeInverse()
        }
        //Always invert the tintColor
        tintColor = tintColor.darkModeInverse()
        
        //Do the same for all subviews
        for subview in subviews {
            subview.darkMode()
        }
    }
    fileprivate func lightMode() {
        
    }
}

extension UIViewController {
    public func darkMode() {
        view.darkMode()
        navigationController?.navigationBar.barTintColor = navigationController?.navigationBar.barTintColor?.darkModeInverse()
        navigationController?.view.darkMode()
    }
}

extension UIColor {
    func inverse() -> UIColor {
        return UIColor(red: 1.0-r(), green: 1.0-g(), blue: 1.0-b(), alpha: 1.0)
    }
    func darkModeInverse() -> UIColor {
        //Don't use black in darkMode -- use darkGray
        var color = inverse()
        if color == UIColor.black {
            color = .darkGray
        }
        return color
    }
}
