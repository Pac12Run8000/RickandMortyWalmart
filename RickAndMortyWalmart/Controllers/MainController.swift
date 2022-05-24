//
//  ViewController.swift
//  RickAndMortyWalmart
//
//  Created by Michelle Grover on 5/21/22.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var character:RickandMortyCharacter?
    var characters = [RickandMortyCharacter]() {
        didSet {
//            print("characters:\(characters)")
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else {return}
                strongSelf.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerXib(nibName: TableViewConstants.customCellXIB, reuseIdentifier: TableViewConstants.customCell)
        NetworkingManager.shared.rickAndMortyAPICall {[weak self] result in
            switch result {
            case .failure(let fail):
                print("failure:\(fail.description)")
            case .success(let data):
                guard let strongSelf = self else {return}
                strongSelf.characters = RickAndMortyCharacterFactory.shared.fetchArrayOfRickAndMortyObjects(data)!
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailSegue") {
            let destViewController = segue.destination as! DetailController
            destViewController.character = self.character
        }
    }
    

    
}

extension MainController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.00
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        character = characters[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
//        print("character", character)
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
}

extension MainController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = characters[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.customCell, for: indexPath) as! CharacterTableViewCell
        cell.character = character
        return cell
    }
}

