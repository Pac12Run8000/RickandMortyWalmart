//
//  DetailController.swift
//  RickAndMortyWalmart
//
//  Created by Michelle Grover on 5/23/22.
//

import UIKit

class DetailController: UIViewController {
    var viewModel:DetailViewModel?
    var character:RickandMortyCharacter? {
        didSet {
            
            guard let character = character else {return}
            print("character: ", character)
//            viewModel = DetailViewModel(character: character)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    

}
