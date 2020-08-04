//
//  UserData.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 06/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import Foundation

class UserData: NSObject, Codable {
    override init() {}
    
    init(userName:String, password:String, isLogged:Bool){
        self.userName = userName
        self.password = password
        self.isLogged = isLogged

    }
    var userName:String = "testUser"
    var password:String = "testPassword"
    var isLogged:Bool = false
}
