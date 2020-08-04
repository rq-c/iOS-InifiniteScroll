//
//  LoginRouter.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 06/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import Foundation
import UIKit

class LoginRouter: LoginRouterProtocol {
    
    static func createLoginModule() -> LoginViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "id_loginviewcontroller") as! LoginViewController
        let presenter: LoginViewProtocol = LoginPresenter()
        let router:LoginRouterProtocol = LoginRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        
        return view
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Login",bundle: Bundle.main)
    }
    
    func pushCharactersViewController(navigation: UINavigationController) {
        let charactersView = CharactersRouter.createCharactersModule()
        navigation.pushViewController(charactersView, animated: true)
    }
    
}
