//
//  UIViewController.swift
//  AR World
//
//  Created by Nate Sesti on 11/28/18.
//  Copyright © 2018 Nate Sesti. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    @objc func done() {
        self.dismiss(animated: true, completion: nil)
    }
    func setupNavigationItem(title: String) {
        self.navigationItem.title = title
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
    }
    func presentWithNav(vc: UIViewController) {
        guard let del = self as? UINavigationControllerDelegate else {return}
        let navVC = UINavigationController(rootViewController: vc)
        navVC.delegate = del
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: vc, action: #selector(vc.done))
        present(navVC, animated: true, completion: nil)
    }
    func presentWithNav(vc: UIViewController, title: String) {
        guard let del = self as? UINavigationControllerDelegate else {return}
        let navVC = UINavigationController(rootViewController: vc)
        navVC.delegate = del
        vc.navigationItem.title = title
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: vc, action: #selector(vc.done))
        present(navVC, animated: true, completion: nil)
    }
}
