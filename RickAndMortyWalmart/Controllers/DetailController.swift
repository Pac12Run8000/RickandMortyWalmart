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
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = CGPoint(x: view.frame.midX, y: view.frame.midY)
        view.addSubview(activityIndicator)
        
        locationsName.text = viewModel?.fetchLocationsName()
        typeTextField.text = viewModel?.fetchType()
        viewModel?.fetchImage(completion: {[weak self] result in
            switch result {
            case .failure(let error):
                print("Error:\(error.description)")
                activityIndicator.stopAnimating()
            case .success(let image):
                guard let strongself = self else {return}
                strongself.imageView.image = image
                activityIndicator.stopAnimating()
            }
        })
        
    }
    

    

}
