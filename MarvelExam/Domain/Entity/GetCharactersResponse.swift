//
//  GetCharacterResponse.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 05/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import Foundation

// MARK: - Characters
class GetCharactersResponse: NSObject, Codable {
    static var singletonCharacters = GetCharactersResponse()
    private override init() {}
    
    var code:Int = 0
    var status:String = ""
    var copyright:String = ""
    var attributionText:String = ""
    var attributionHTML:String = ""
    var etag:String = ""
    var data: Content!
}

struct Content: Codable {
    var offset: Int = 0
    var limit: Int = 0
    var total: Int = 0
    var count: Int = 0
    var results: [Results]!
}

struct Results: Codable {
    var id: Int = 0
    var name: String = ""
    var description: String = ""
    var modified: String = ""
    var thumbnail: Thumbnail!
}

struct Thumbnail: Codable {
    var path: String = ""
    var `extension`: String = ""
}

class Characters:NSObject {
    static let singletonCharacters = Characters()
    private override init() {}
    
    func destroy() {
        Characters.singletonCharacters.loadCharacters = ArraySlice<Results>()
        Characters.singletonCharacters.limit = 100
        Characters.singletonCharacters.offset = 0
        Characters.singletonCharacters.length = 10
    }
    
    var loadCharacters = ArraySlice<Results>()
    var limit:Int = 100
    var offset: Int  = 0
    var length:Int = 10
}
