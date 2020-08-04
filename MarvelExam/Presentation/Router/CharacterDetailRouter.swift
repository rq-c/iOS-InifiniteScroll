//
//  CharacterRouter.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 05/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import Foundation
import UIKit

class CharacterDetailRouter: CharacterDetailRouterProtocol {
    
    
    static func createCharacterDetailModule() -> CharacterDetailViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "id_characterdetailviewcontroller") as! CharacterDetailViewController
        
        let presenter: CharacterDetailViewProtocol = CharacterDetailPresenter()
        let router:CharacterDetailRouterProtocol = CharacterDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        
        return view
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }


}
