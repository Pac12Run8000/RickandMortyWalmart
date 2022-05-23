//
//  ViewController.swift
//  RickAndMortyWalmart
//
//  Created by Michelle Grover on 5/21/22.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerXib(nibName: TableViewConstants.customCellXIB, reuseIdentifier: TableViewConstants.customCell)
        
        NetworkingManager.rickAndMortyAPICall { result in
            switch result {
            case .failure(let err):
                print(err)
            case .success(let data):
                print(data)
            }
        }
        
    }
    

    
}

extension MainController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.00
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MainController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.customCell, for: indexPath) as! CharacterTableViewCell
        cell.nameLabel.text = "Norbert Grover"
//        cell.nameLabel.text = "Norbert Grover"
//        cell.statusLabel.text = "Alive"
//        cell.speciesLabel.text = "Human"
        return cell
    }
}

