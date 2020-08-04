//
//  UserPersistentData.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 06/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import Foundation


class UserPersistentData {
    let encoder = JSONEncoder()
    let defaults = UserDefaults.standard
    
    func save<T: UserData> (data: T){
        let user:UserData = data
        defaults.set(try? PropertyListEncoder().encode(user), forKey: "user")
        defaults.synchronize()
    }
    
    func fetch() -> (UserData?){
        var user:UserData!
        if let userData = defaults.object(forKey: "user") as? Data{
            user = try? PropertyListDecoder().decode(UserData.self, from: userData)
            defaults.synchronize()
        }
        return user
    }
    
    func isLogged() -> Bool{
        let user = fetch()
        return user?.isLogged ?? false
    }
    
    func logOut(){
        CharacterPersistentData().deleteAll()
        let characters = CharacterPersistentData().fetch()
        let user = fetch()
        user?.isLogged = false
        defaults.set(try? PropertyListEncoder().encode(user), forKey: "user")
        defaults.synchronize()
    }
    

}
