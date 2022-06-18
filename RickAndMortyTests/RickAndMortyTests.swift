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
    var malFormedURL:URL?
   
    override func setUpWithError() throws {
        url = ComponentConstants.fetchCharactersURLComponent()?.url
        
        var components = URLComponents()
            components.scheme = "https"
            components.host = "rickandmortyapi.com"
            components.path = "/api/characterss"
        malFormedURL = components.url
        
    }

    override func tearDownWithError() throws {
        url = nil
    }
    
    
    
    func testMalformedURLNetworkManager() throws {
        let expectation = expectation(description: "response3")
        NetworkingManager.shared.rickAndMortyAPICall(url: malFormedURL!) { result in
            switch result {
            case .failure(let err):
                XCTAssertEqual(err, APIErrors.httpResponseStatusCodeError(statusCode: 404))
//                XCTFail(err.localizedDescription)
            case .success(let data):
                XCTAssertNotNil(data)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }
    
    func testNilURLNetworkManager() throws {
        let expectation = expectation(description: "response1")
        NetworkingManager.shared.rickAndMortyAPICall(url: nil) { result in
            switch result {
            case .failure(let err):
                XCTAssertEqual("The URL is nil", err.description)
//                XCTFail("\(err.description)")
//                XCTAssertEqual("The app could not complete the request: unsupported URL", err.description)
            case .success(let data):
                XCTAssertNotNil(data)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }

    func testNetworkManager() throws {
        let expectation = expectation(description: "response2")
        
        NetworkingManager.shared.rickAndMortyAPICall(url: url!) { result in
            // async await
            // XCTest: expectation
            switch result {
            case .failure(let err):
                XCTAssertEqual(err.description, "The app could not complete the request: The Internet connection appears to be offline.")
//                XCTFail("The call failed because: \(err.description)")
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
