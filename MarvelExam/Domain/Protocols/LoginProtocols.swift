//
//  LoginProtocols.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 06/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import Foundation
import UIKit

protocol LoginViewProtocol: class {
    var view: LoginPresenterProtocol? { get set }
    var router: LoginRouterProtocol? { get set }
    
    func pushCharactersViewController(navigation: UINavigationController)
    func validateLoginIsSuccess(user: String, password: String) -> Bool
}

protocol LoginPresenterProtocol: class {

}

protocol LoginRouterProtocol: class {
    static  func createLoginModule()->LoginViewController
    func pushCharactersViewController(navigation: UINavigationController)
}
