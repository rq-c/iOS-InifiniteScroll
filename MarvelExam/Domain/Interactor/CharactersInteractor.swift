//
//  CharactersInteractor.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 05/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import Foundation


class CharactersInteractor: CharactersInteractorProtocol {
    var presenter: CharactersOutputInteractorProtocol?
    
    func getCharacters(request: GetCharactersRequest, completionHandler: ((GetCharactersResponse?, Error?) -> Void)?) {
        GetCharactersService.getCharacter(request: request) { (result) in
            switch result {
                case .success(let res):
                    let response = res
                    self.presenter?.getCharactersSuccessful(data: response)
                    completionHandler!(response, nil)
                case .failure(let error):
                    self.presenter?.getCharactersFailed()
                    print(error.localizedDescription)
                    completionHandler!(nil, error)
            }
        }

    }
    
}
