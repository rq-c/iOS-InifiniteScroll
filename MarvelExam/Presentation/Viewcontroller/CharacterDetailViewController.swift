//
//  CharacterDetailViewController.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 05/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterDetailViewController: UIViewController {
    @IBOutlet weak var imageOfCharacter: UIImageView!
    var presenter: CharacterDetailViewProtocol?
    @IBOutlet weak var nameOfCharacter: UITextField!
    @IBOutlet weak var descriptionOfCharacter: UITextField!
    var character:Results!
    var selected:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setUpCharacter(selected: selected, view: self)
    }
    
    @IBAction func editCharacterActionButtonTapped(_ sender: Any) {
        presenter?.updateCharacter(selected: selected, view: self)
    }
    
    @IBAction func deleteCharacterActionButtonTapped(_ sender: Any) {
        presenter?.deleteCharacter(selected: selected, view: self)
    }
    
    @IBAction func backActionButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension CharacterDetailViewController: CharacterDetailPresenterProtocol{
    
}

