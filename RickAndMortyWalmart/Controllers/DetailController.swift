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
        viewModel?.fetchImage(completion: { result in
            switch result {
            case .failure(let error):
                print("Error:\(error.description)")
            case .success(let image):
                self.imageView.image = image
            }
        })
        
    }
    

    

}
