//
//  TableView+extension.swift
//  RickAndMortyWalmart
//
//  Created by Michelle Grover on 5/22/22.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerXib(nibName:String, reuseIdentifier:String) {
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
}
