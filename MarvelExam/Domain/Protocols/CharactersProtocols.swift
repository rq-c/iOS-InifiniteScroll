//
//  CharactersProtocols.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 05/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import Foundation
import UIKit

protocol CharactersViewProtocol: class {
    var view: CharactersPresenterProtocol? { get set }
    var router: CharactersRouterProtocol? { get set }
    var interactor: CharactersInteractorProtocol? { get set }
    
    func executeGetCharactersService(request: GetCharactersRequest, completionHandler: ((GetCharactersResponse?, Error?) -> Void)?)
    func pushCharacterDetailViewController(navigationController:UINavigationController, index:Int)
    func logOut(navigation:UINavigationController)
    
}

protocol CharactersPresenterProtocol: class {
    func onSuccess(data: GetCharactersResponse)
    func onFailure()
}

/// Communication Protocol between: Presenter and Interactor
protocol CharactersInteractorProtocol: class {
    var presenter:CharactersOutputInteractorProtocol? { get set }
    func getCharacters(request : GetCharactersRequest, completionHandler: ((GetCharactersResponse?, Error?) -> Void)?)
    
}

/// Communication Protocol between: Interactor and Presenter
protocol CharactersOutputInteractorProtocol: class {
    func getCharactersSuccessful(data: GetCharactersResponse)
    func getCharactersFailed()
}

protocol CharactersRouterProtocol: class {
    static  func createCharactersModule()->CharactersViewController
    func pushCharacterDetailViewController(navigation: UINavigationController, index:Int)
    func logOut(navigation:UINavigationController)
    
}

