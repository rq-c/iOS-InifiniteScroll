//
//  Strings.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 05/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import Foundation

struct Strings {
    struct Keys {
        static let timeStamp:String = String(Date().currentTimeMillis())
        static let privateKey:String = "d47aed99578ef493f8605de2b5ee7dbe2af527bf"
        static let publicKey:String = "a163c79ca795991c9fb367825ebbae88"
        static let hash:String = (timeStamp + privateKey + publicKey).md5()!
    }
}

