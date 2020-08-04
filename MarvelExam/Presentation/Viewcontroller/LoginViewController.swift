//
//  LoginViewController.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 06/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var presenter: LoginViewProtocol?
    

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passwordKey: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func loginActionButtonTapped(_ sender: Any) {
        login()
    }
    
    func login(){
        let isSuccess = presenter?.validateLoginIsSuccess(user: userName.text!, password: passwordKey.text!)
        if isSuccess! {
            UserPersistentData().save(data: UserData(userName: userName.text!, password: passwordKey.text!, isLogged: true))
            presenter?.pushCharactersViewController(navigation: navigationController!)
        }else{
            Alerts().show(title: "Lo sentimos", description: "Usuario o contraseña incorrecta", titleAction: "Intentar de nuevo", navigation: navigationController!, delegate: false)
        }
    }
    
    override func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      if textField == userName {
         textField.resignFirstResponder()
         passwordKey.becomeFirstResponder()
      } else if textField == passwordKey {
         self.view.endEditing(true)
        login()
      }
     return true
    }
    
    
}

extension LoginViewController: LoginPresenterProtocol{
    
}
