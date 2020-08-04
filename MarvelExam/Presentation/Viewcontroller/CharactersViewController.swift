//
//  CharactersViewController.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 05/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import UIKit
import Kingfisher

class CharactersViewController: UIViewController {
    var presenter: CharactersViewProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var charactersLabel: UILabel!
    
    var characters      = Array<Results>()
    let loadData        = Characters.singletonCharacters


    override func viewDidLoad() {
        super.viewDidLoad()
        let loadingNib = UINib(nibName: "LoadingCell", bundle: nil)
        tableView.register(loadingNib, forCellReuseIdentifier: "loadingCell")
    }
    
    
    /// Character Loading
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let data = CharacterPersistentData().fetch()
        if(data != nil){
            characters = data!.data.results
            loadData.offset = characters.count
    
            loadData.length  = (loadData.length > characters.count ? characters.count : loadData.length)
            loadData.loadCharacters = characters[0...(loadData.length-1)]

            charactersLabel.text = "Personajes: \(loadData.loadCharacters.count)"
            self.tableView.reloadData()
        }else{
            getCharacters(limit: loadData.limit, offset: loadData.offset)
        }
    }
    
    @IBAction func logOutActionButtonTapped(_ sender: Any) {
            self.presenter?.logOut(navigation: self.navigationController!)
    }
    
    func getCharacters(limit: Int, offset:Int){
        let keys = Strings.Keys.self
        presenter?.executeGetCharactersService(request: GetCharactersRequest(ts: keys.timeStamp, apikey: keys.publicKey, hash: keys.hash, limit: limit, offset: offset), completionHandler: { (_, _) in})
    }
    
}

extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { return 2 }
    
    /// Definition of the number of cells to display
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = section == 0 ? loadData.loadCharacters.count :
            section == 1 ? 1 : 0
        return count
    }
    
    /// Show cell data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CharacterTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CharacterTableViewCell
        let loadingCell = tableView.dequeueReusableCell(withIdentifier: "loadingCell", for: indexPath) as! LoadingTableViewCell
        if indexPath.section == 0 {
            let character = loadData.loadCharacters[indexPath.row]
            cell.nameOfCharacter?.text  = character.name
            let urlImage = (character.thumbnail.path) + "." + (character.thumbnail.extension)
            let url = URL(string: urlImage)!
            cell.imageOfCharacter?.kf.setImage(with: url)
            return cell
        }else {
            loadingCell.spinner.startAnimating()
            return loadingCell
        }
        
    }
    
    /// Action when selecting a cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.pushCharacterDetailViewController(navigationController: navigationController!, index:indexPath.row)
    }
    
    /// Configuration for inifinite scroll
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = loadData.loadCharacters.count - 1
        if(indexPath.row == lastItem){
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                self.loadMoreCharacters()
            })
        }
        
    }
    
    func loadMoreCharacters(){
        if self.loadData.loadCharacters.count < self.characters.count {
            var index = self.loadData.loadCharacters.count
            let limitZero  = self.characters.count - self.loadData.loadCharacters.count
            
            loadData.length = limitZero <= 9 ? index + limitZero :
                index + 10
            
            while index < loadData.length {
                loadData.loadCharacters = characters[0...loadData.length-1]
                self.charactersLabel.text = "Personajes: \(loadData.loadCharacters.count)"
                index = index + 1
            }
            self.tableView.reloadData()
        }
        if self.loadData.loadCharacters.count >= self.characters.count{
            getCharacters(limit: loadData.limit, offset: loadData.offset)
        }
    }
}

extension CharactersViewController: CharactersPresenterProtocol {
    
    /**
        Successful response
        - Parameter data: GetCharactersResponse
     */
    func onSuccess(data: GetCharactersResponse) {
        let total = data.data!.total
        let result = CharacterPersistentData().fetch()
        let lengthCharacters = result?.data.results.count
        
        if result != nil && lengthCharacters! < total {
            for item in data.data.results{
                result?.data.results.append(item)
            }
            CharacterPersistentData().save(data: result!)
            characters = (result?.data.results)!
        }else{
            CharacterPersistentData().save(data: data)
            let result = CharacterPersistentData().fetch()
            characters = (result?.data.results)!
        }

        loadData.loadCharacters = characters[0...loadData.length-1]
        charactersLabel.text = "Personajes: \(loadData.loadCharacters.count)"
        
        self.tableView.reloadData()
    }
    
    ///Failure response
    func onFailure() {
        Alerts().show(title: "Alerta", description: "Problema al obtener datos", titleAction: "Okay", navigation: navigationController!, delegate: false)
    }
}
