//
//  KeyboardManager.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 06/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import IQKeyboardManagerSwift

class KeyboardManager {
    func focusEditText(){
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
    }
}
