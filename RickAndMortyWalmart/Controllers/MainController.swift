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
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.customCell, for: indexPath) as UITableViewCell
        cell.textLabel?.text = "Me Me"
        cell.detailTextLabel?.text = "Me Me"
        return cell
    }
    
    
}

