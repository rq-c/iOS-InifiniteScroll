//
//  CharacterDetailProtocols.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 05/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import Foundation
import UIKit

protocol CharacterDetailViewProtocol: class {
    var view: CharacterDetailPresenterProtocol? { get set }
    var router: CharacterDetailRouterProtocol? { get set }
    
    func getCharacter(selected:Int) -> Results
    func setUpCharacter(selected:Int, view:CharacterDetailViewController)
    func updateCharacter(selected:Int, view:CharacterDetailViewController)
    func deleteCharacter(selected:Int, view:CharacterDetailViewController)
}

protocol CharacterDetailPresenterProtocol: class {}

protocol CharacterDetailRouterProtocol: class {
    static  func createCharacterDetailModule()->CharacterDetailViewController
}
