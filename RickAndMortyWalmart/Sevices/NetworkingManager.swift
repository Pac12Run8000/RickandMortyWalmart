//
//  NetworkingManager.swift
//  RickAndMortyWalmart
//
//  Created by Michelle Grover on 5/22/22.
//

import Foundation
import UIKit

class NetworkingManager {
    
    static let shared = NetworkingManager()
    
    func rickAndMortyAPICall(url:URL?, completion:@escaping(Result<Data, APIErrors>) -> ()) {
        guard let url = url else {
            completion(.failure(.nilURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(.datataskError(err: error!)))
                return
            }
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                completion(.failure(.httpResponseStatusCodeError(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0)))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
