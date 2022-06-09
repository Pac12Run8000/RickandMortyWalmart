//
//  APIErrors.swift
//  RickAndMortyWalmart
//
//  Created by Michelle Grover on 5/22/22.
//

import Foundation

enum APIErrors:Error, Equatable {
    
    
    case datataskError(err:Error)
    case httpResponseStatusCodeError(statusCode:Int)
    case noData
    case malformedURL
    case jsonError(err:String)
    case emptyStringURL
    case nilURL
    
    static func == (lhs: APIErrors, rhs: APIErrors) -> Bool {
        return true
    }
}

enum JSONErrors:Error {
    case parseError
}

extension APIErrors:CustomStringConvertible {
    var description: String {
        switch self {
        case .datataskError(err: let err):
            return "The app could not complete the request: \(err.localizedDescription)"
        case .httpResponseStatusCodeError(statusCode: let num):
            return "The app sent a request, but it didn't work. Try again later: \(num)"
        case .noData:
            return "There is no data return base on your search criteria."
        case .malformedURL:
            return "Invalid request"
        case .jsonError(err: let err):
            return "Couldn't use the data: \(err.description)"
        case .emptyStringURL:
            return "The url scheme and host are empty."
        case .nilURL:
            return "The URL is nil"
        }
    }
    
    
}
