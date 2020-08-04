//
//  LoginPresenter.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 06/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import Foundation
import UIKit

class LoginPresenter: LoginViewProtocol {
    
    var view: LoginPresenterProtocol?
    var router: LoginRouterProtocol?
    let userData = UserData()
    
    func pushCharactersViewController(navigation: UINavigationController) {
        router?.pushCharactersViewController(navigation: navigation)
    }
    
    func validateLoginIsSuccess(user: String, password: String) -> Bool{
        let isSuccess = (user == userData.userName && password == userData.password) ? true : false
        return isSuccess
    }
}
