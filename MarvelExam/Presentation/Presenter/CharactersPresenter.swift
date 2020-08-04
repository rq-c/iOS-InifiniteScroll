//
//  CharactersPresenter.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 05/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import Foundation
import UIKit

class CharactersPresenter:CharactersViewProtocol {
    
    
    var interactor: CharactersInteractorProtocol?
    var view: CharactersPresenterProtocol?
    var router: CharactersRouterProtocol?
    let singletonCharacters = Characters.singletonCharacters
    
    func executeGetCharactersService(request: GetCharactersRequest, completionHandler: ((GetCharactersResponse?, Error?) -> Void)?) {
        interactor?.getCharacters(request: request, completionHandler: { (_, _) in})
        singletonCharacters.offset+=singletonCharacters.limit
    }
    
    func pushCharacterDetailViewController(navigationController: UINavigationController, index:Int) {
        router?.pushCharacterDetailViewController(navigation: navigationController, index:index)
    }
    func logOut(navigation: UINavigationController) {
        UserPersistentData().logOut()
        router?.logOut(navigation: navigation)
    }

}

extension CharactersPresenter: CharactersOutputInteractorProtocol{
    func getCharactersSuccessful(data: GetCharactersResponse) {
        view?.onSuccess(data: data)
    }
    
    func getCharactersFailed() {
        view?.onFailure()
    }
}

