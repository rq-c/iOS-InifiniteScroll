//
//  CharacterPresenter.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 05/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import Foundation

class CharacterDetailPresenter:CharacterDetailViewProtocol {
    var view: CharacterDetailPresenterProtocol?
    var router: CharacterDetailRouterProtocol?
    var character:Results!

    func getCharacter(selected:Int) -> Results{
        let character = CharacterPersistentData().fetchSingle(index: selected)
        return character
    }
    
    func setUpCharacter(selected:Int, view:CharacterDetailViewController){
        character = getCharacter(selected: selected)
        view.nameOfCharacter.text = character?.name
        view.descriptionOfCharacter.text = character?.description
        let urlImage = (character?.thumbnail.path)! + "." + (character?.thumbnail.extension)!
        let url = URL(string: urlImage)!
        view.imageOfCharacter.kf.setImage(with: url)
    }
    
    func updateCharacter(selected:Int, view:CharacterDetailViewController){
        character = getCharacter(selected: selected)
        CharacterPersistentData().update(updateCharacter: Results(id: character.id, name: view.nameOfCharacter.text!, description: view.descriptionOfCharacter.text!, modified: character.modified, thumbnail: character.thumbnail), index: selected)
        Alerts().show(title: "Muy bien!", description: "El personaje ha sido modificado", titleAction: "Okay", navigation: view.navigationController!, delegate: false)
    }
    
    func deleteCharacter(selected:Int, view:CharacterDetailViewController){
        CharacterPersistentData().delete(index: selected)
        Alerts().show(title: "Oops!", description: "El personaje ha sido eliminado :(", titleAction: "Okay", navigation: view.navigationController!, delegate: true)
    }

}

