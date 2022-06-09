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
        url = ComponentConstants.fetchCharactersURLComponent()?.url
    }

    override func tearDownWithError() throws {
        url = nil
    }
    
    func testNilURLNetworkManager() throws {
        let expectation = expectation(description: "response1")
        NetworkingManager.shared.rickAndMortyAPICall(url: url!) { result in
            switch result {
            case .failure(let err):
                XCTFail("\(err.description)")
            case .success(let data):
                XCTAssertNotNil(data)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 6)
    }

    func testNetworkManager() throws {
        let expectation = expectation(description: "response2")
        
        NetworkingManager.shared.rickAndMortyAPICall(url: url!) { result in
            // async await
            // XCTest: expectation
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
