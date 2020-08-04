//
//  Alerts.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 08/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import UIKit

class Alerts {
    func show(title:String, description:String, titleAction:String, navigation:UINavigationController, delegate: Bool){
        let alert = UIAlertController(title: title, message: description, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: titleAction, style: UIAlertAction.Style.default, handler: {_ in
            if delegate == true{ navigation.popViewController(animated: true) }
        }))
        navigation.present(alert, animated: true, completion: nil)
    }
}
