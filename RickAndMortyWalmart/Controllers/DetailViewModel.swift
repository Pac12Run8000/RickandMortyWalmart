//
//  DetailViewModel.swift
//  RickAndMortyWalmart
//
//  Created by Michelle Grover on 5/23/22.
//

import Foundation

class DetailViewModel {
    var character:RickandMortyCharacter?
    
    init(character:RickandMortyCharacter) {
        self.character = character
    }
    
    func fetchLocationsName() -> String {
        guard let name = character?.name else {return ""}
        return "Character name: \(name)"
    }
    
    func fetchType() -> String {
        guard let type = character?.type else {return ""}
        return type
    }
    
    
}
