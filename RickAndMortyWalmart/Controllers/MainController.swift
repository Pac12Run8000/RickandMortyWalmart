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
        
        setupTableView()
        
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: "CharacterTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }


    
    
}

extension MainController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.00
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

