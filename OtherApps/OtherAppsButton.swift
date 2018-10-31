//
//  OtherAppsButton.swift
//  AR World
//
//  Created by Nate Sesti on 10/26/18.
//  Copyright © 2018 Nate Sesti. All rights reserved.
//

import UIKit

class OtherAppsButton: UIButton {
    var parentVC: UIViewController!
    @objc func presentOtherApps() {
        let table = OtherAppsTableViewController()
        parentVC.present(table, animated: true, completion: nil)
    }
    func setUp(parentVC: UIViewController) {
        self.parentVC = parentVC
        setImage(UIImage(named: "ZStudiosLogo.png"), for: .normal)
        addTarget(self, action: #selector(presentOtherApps), for: .touchUpInside)
        frame.size = CGSize(100)
    }
}
