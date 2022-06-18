//
//  NetworkManager.swift
//  RickAndMortyTests
//
//  Created by Michelle Grover on 6/17/22.
//

import XCTest
@testable import RickAndMortyWalmart

class NetworkManager: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRickAndMortyAPICall() throws {
        let url = ComponentConstants.fetchCharactersURLComponent()?.url
        let expectation = expectation(description: "api call test")
        NetworkingManager.shared.rickAndMortyAPICall(url: url) { result in
            switch result {
            case .failure(let err):
                XCTAssertEqual(err.description, "The app could not complete the request: The Internet connection appears to be offline.")
            case .success(let data):
                XCTAssertNotNil(data)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
