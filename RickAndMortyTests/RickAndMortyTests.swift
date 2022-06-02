//
//  RickAndMortyTests.swift
//  RickAndMortyTests
//
//  Created by Michelle Grover on 5/31/22.
//

import XCTest
@testable import RickAndMortyWalmart

class RickAndMortyTests: XCTestCase {
    
    var url:URL?
   
    override func setUpWithError() throws {
        
//        url = ComponentConstants.fetchCharactersURLComponent()?.url
        var components = URLComponents()
            components.scheme = "https"
            components.host = "rickandmortyapi.com"
            components.path = "/api/character"
        url = components.url
        
    }

    override func tearDownWithError() throws {
        
        url = nil
    }

    func testExample() throws {
        let expectation = expectation(description: "Waiting for rick and morty")
        
        NetworkingManager.shared.rickAndMortyAPICall(url: url!) { result in
            // async await
            // XCTest: expectation
            
            
           // This works when the API is getting information
//            XCTFail("\(result)")
            
            switch result {
            case .failure(let err):
                XCTFail("The call failed because: \(err.description)")
            case .success(let data):
                XCTAssertNotNil(data)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
