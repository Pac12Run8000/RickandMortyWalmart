//
//  DownloadImageErrors.swift
//  RickAndMortyWalmart
//
//  Created by Michelle Grover on 5/24/22.
//

import Foundation

enum DownloadImageErrors:Error {
    case noData
    case urlSessionTaskError(err:Error)
    case dataConversionFailed
}


extension DownloadImageErrors:CustomStringConvertible {
    var description: String {
        switch self {
        case .noData:
            return "There is no image data."
        case .urlSessionTaskError(err: let error):
            return "There was a problem retrieving data:\(error.localizedDescription)"
        case .dataConversionFailed:
            return "Couldn't create image."
        }
    }
    
    
}
