//
//  CharacterPersistentData.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 05/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import Foundation


class CharacterPersistentData {
    let encoder     = JSONEncoder()
    let defaults    = UserDefaults.standard
    let characters  = GetCharactersResponse.singletonCharacters
    let singletonCharacters = Characters.singletonCharacters

    func save<T: GetCharactersResponse> (data: T){
        let dataFinal:GetCharactersResponse! = data
        
        defaults.set(try? PropertyListEncoder().encode(dataFinal), forKey: "characters")
        defaults.synchronize()
    }
    
    func fetch() -> (GetCharactersResponse?){
        var characters:GetCharactersResponse!
        if let charactersData = defaults.object(forKey: "characters") as? Data{
            characters = try? PropertyListDecoder().decode(GetCharactersResponse.self, from: charactersData)
            defaults.synchronize()
        }
        return characters
    }
    
    func fetchSingle(index:Int) -> Results{
        var characters:GetCharactersResponse!
        var character:Results!
        
        if let charactersData = defaults.object(forKey: "characters") as? Data {
            characters = try? PropertyListDecoder().decode(GetCharactersResponse.self, from: charactersData)
            character = characters.data.results[index]
            defaults.synchronize()
        }
        return character
    }
    
    func update(updateCharacter:Results, index:Int){
        let characters:GetCharactersResponse = fetch()!
        let character = updateCharacter
        characters.data.results[index] = character
        defaults.set(try? PropertyListEncoder().encode(characters), forKey: "characters")
        defaults.synchronize()
    }
    
    func delete(index:Int){
        let data = fetch()
        data?.data.results.remove(at: index)
        singletonCharacters.loadCharacters.remove(at: index)
        singletonCharacters.length-=1
        defaults.set(try? PropertyListEncoder().encode(data), forKey: "characters")
        defaults.synchronize()
    }
    
    func deleteAll(){
        defaults.removeObject(forKey: "characters")
        defaults.synchronize()
        singletonCharacters.destroy()
    }
    
}
