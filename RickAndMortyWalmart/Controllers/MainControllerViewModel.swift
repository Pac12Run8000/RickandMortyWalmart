//
//  MainControllerViewModel.swift
//  RickAndMortyWalmart
//
//  Created by Michelle Grover on 5/23/22.
//

import Foundation


class MainControllerViewModel {
    var rickAndMortyCharacters:[RickandMortyCharacter]?
    
    init(rickAndMortyCharacters:[RickandMortyCharacter]) {
        self.rickAndMortyCharacters = rickAndMortyCharacters
    }
}
