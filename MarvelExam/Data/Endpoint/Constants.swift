//
//  Constants.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 05/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import Foundation

struct Constants {
    struct Server {
        static let baseURL = "https://gateway.marvel.com"
    }
    
    struct EndPoint {
        static let getCharacteres:String = "/v1/public/characters"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
