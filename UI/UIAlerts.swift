//
//  UIAlerts.swift
//  AR World
//
//  Created by Nate Sesti on 10/23/18.
//  Copyright © 2018 Nate Sesti. All rights reserved.
//

import Foundation
import UIKit

func alert(title: String, hasTextField: Bool, message: String?, completion: @escaping ((UIAlertController) -> Void)) -> UIAlertController {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    if hasTextField {
        alert.addTextField(configurationHandler: nil)
    }
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    let newCompletion: (UIAlertAction) -> Void = { (action) in
        completion(alert)
    }
    let doneAction = UIAlertAction(title: "Done", style: .default, handler: newCompletion)
    
    alert.addAction(doneAction)
    return alert
}

extension UIAlertController {
    func addCancel(title: String = "Cancel") {
        self.addAction(UIAlertAction(title: title, style: .cancel, handler: nil))
    }
}
