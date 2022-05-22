//
//  ComponentConstants.swift
//  RickAndMortyWalmart
//
//  Created by Michelle Grover on 5/22/22.
//

import Foundation

struct ComponentConstants {
    
    static func fetchCharactersURLComponent(queries:[URLQueryItem]? = nil) -> URLComponents {
        var components = URLComponents()
            components.scheme = "https"
            components.host = "rickandmortyapi.com"
            components.path = "/api/character"
        if let queries = queries {
            components.queryItems = queries
        }
        return components
    }
}
