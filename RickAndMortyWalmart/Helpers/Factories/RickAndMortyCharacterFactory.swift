//
//  RickAndMortyCharacterFactory.swift
//  RickAndMortyWalmart
//
//  Created by Michelle Grover on 5/23/22.
//

import Foundation


class RickAndMortyCharacterFactory {
    
    static let shared = RickAndMortyCharacterFactory()
    
    func fetchArrayOfRickAndMortyObjects(_ data:Data) throws -> [RickandMortyCharacter]? {
        guard let response = try? JSONDecoder().decode(RickAndMortyResponse.self, from: data) else {
            throw APIErrors.jsonError(err: "The transformation from data(using: .utf8) to custom object model failed.")
        }
        return response.results
    }
    
    
}

