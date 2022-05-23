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
            nameLabel.text = character?.name
            statusLabel.text = character?.status
            speciesLabel.text = character?.species
            genderLabel.text = character?.gender
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
