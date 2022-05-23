//
//  CharacterTableViewCell.swift
//  RickAndMortyWalmart
//
//  Created by Michelle Grover on 5/22/22.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    var character:RickandMortyCharacter? {
        didSet {
            nameLabel.text = "name: " + character!.name
            statusLabel.text = "status: " + character!.status
            speciesLabel.text = "species: " + character!.species
            genderLabel.text = "gender: " + character!.gender
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
