//
//  GetCharacterService.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 05/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import Foundation
import Alamofire

class GetCharactersService {
    static func getCharacter(request: GetCharactersRequest, completion:@escaping (Result<GetCharactersResponse>) -> Void) {
        ServiceCallback.performRequest(
            route: Router.getCharacters(request: request),
            completion: completion
        )
    }
}

struct GetCharactersRequest: Codable {
    var ts: String
    var apikey: String
    var hash: String
    var limit: Int
    var offset: Int
}
