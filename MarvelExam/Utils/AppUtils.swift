//
//  AppUtils.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 05/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import Foundation
import UIKit

/// Change color status bar
func backgroundColorStatusBar(window:UIWindow?){
    if #available(iOS 13.0, *) {
        let app = UIApplication.shared
        let statusBarHeight: CGFloat = app.statusBarFrame.size.height

        let statusbarView = UIView()
        statusbarView.backgroundColor = #colorLiteral(red: 0.9301576018, green: 0.1793670356, blue: 0.1331951618, alpha: 1)
        window!.addSubview(statusbarView)
      
        statusbarView.translatesAutoresizingMaskIntoConstraints = false
        statusbarView.heightAnchor
            .constraint(equalToConstant: statusBarHeight).isActive = true
        statusbarView.widthAnchor
            .constraint(equalTo: window!.widthAnchor, multiplier: 1.0).isActive = true
        statusbarView.topAnchor
            .constraint(equalTo: window!.topAnchor).isActive = true
        statusbarView.centerXAnchor
            .constraint(equalTo: window!.centerXAnchor).isActive = true
      
    } else {
        let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
        statusBar?.backgroundColor = #colorLiteral(red: 0.9301576018, green: 0.1793670356, blue: 0.1331951618, alpha: 1)
    }
}


