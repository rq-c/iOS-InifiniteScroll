//
//  CharactersRouter.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 05/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import Foundation
import UIKit

class CharactersRouter: CharactersRouterProtocol {
    
    
    static func createCharactersModule() -> CharactersViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "id_charactersviewcontroller") as! CharactersViewController
        

        let presenter: CharactersViewProtocol & CharactersOutputInteractorProtocol = CharactersPresenter()
        let interactor: CharactersInteractorProtocol = CharactersInteractor()
        let router:CharactersRouterProtocol = CharactersRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func pushCharacterDetailViewController(navigation: UINavigationController, index:Int) {
        let detailView = CharacterDetailRouter.createCharacterDetailModule()
        detailView.selected = index
        navigation.pushViewController(detailView, animated: true)
    }
    
    func logOut(navigation: UINavigationController) {
        navigation.dismiss(animated: true, completion: {
            let loginView = LoginRouter.createLoginModule()
            navigation.pushViewController(loginView, animated: false)
        })


    }

}
