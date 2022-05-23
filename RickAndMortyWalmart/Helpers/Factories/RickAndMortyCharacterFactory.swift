//
//  RickAndMortyCharacterFactory.swift
//  RickAndMortyWalmart
//
//  Created by Michelle Grover on 5/23/22.
//

import Foundation


class RickAndMortyCharacterFactory {
    static let shared = RickAndMortyCharacterFactory()
    func fetchArrayOfRickAndMortyObjects(_ data:Data) -> [RickandMortyCharacter]? {
        guard let response = try? JSONDecoder().decode(RickAndMortyResponse.self, from: data) else {return nil}
        return response.results
    }
    
    
}

