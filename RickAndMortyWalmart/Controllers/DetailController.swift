//
//  DetailController.swift
//  RickAndMortyWalmart
//
//  Created by Michelle Grover on 5/23/22.
//

import UIKit

class DetailController: UIViewController {
    
    @IBOutlet weak var locationsName:UITextField!
    @IBOutlet weak var typeTextField:UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var viewModel:DetailViewModel?
    
    var character:RickandMortyCharacter? {
        didSet {
            guard let character = character else {return}
            viewModel = DetailViewModel(character: character)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        locationsName.text = viewModel?.fetchLocationsName()
        typeTextField.text = viewModel?.fetchType()
        
    }
    

    

}
