//
//  UIViewcontroller+Extension.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 07/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import UIKit

extension UIViewController: UITextFieldDelegate{
    //Hide the keyboard for any text field when the UI is touched outside of the keyboard.
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}
