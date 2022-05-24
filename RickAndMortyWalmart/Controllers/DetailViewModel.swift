//
//  DetailViewModel.swift
//  RickAndMortyWalmart
//
//  Created by Michelle Grover on 5/23/22.
//

import Foundation
import UIKit

class DetailViewModel {
    var character:RickandMortyCharacter?
    var imageURL:URL?
    
    init(character:RickandMortyCharacter) {
        self.character = character
        if let imageURL = URL(string: character.image) {
            self.imageURL = imageURL
        }
    }
    
    func fetchLocationsName() -> String {
        guard let name = character?.name else {return ""}
        return "Character name: \(name)"
    }
    
    func fetchType() -> String {
        guard let type = character?.type else {return ""}
        return type
    }
    
    func fetchImage(completion:@escaping(Result<UIImage, DownloadImageErrors>) -> ()) {
        guard let imageURL = imageURL else {return}
        let mainQueue = DispatchQueue.main
        let backGroundQueue = DispatchQueue.global(qos: .userInitiated)
        backGroundQueue.async {
            URLSession.shared.dataTask(with: imageURL) { data, response, error in
                mainQueue.async {
                    guard error == nil else {
                        completion(.failure(.urlSessionTaskError(err: error!)))
                        return
                    }
                    guard let data = data else {
                        completion(.failure(.noData))
                        return
                    }
                    guard let image = UIImage(data: data) else {
                        completion(.failure(.dataConversionFailed))
                        return
                    }
                        completion(.success(image))
                }
            }.resume()
        }
        
    }
    
    
    
}
