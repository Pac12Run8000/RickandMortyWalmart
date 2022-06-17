//
//  RickAndMortyObjectsTests.swift
//  RickAndMortyTests
//
//  Created by Michelle Grover on 6/10/22.
//

import XCTest
@testable import RickAndMortyWalmart

class RickAndMortyObjectsTests: XCTestCase {
    var data:Data?
    var url:URL?
    
    override func setUpWithError() throws {
        url = ComponentConstants.fetchCharactersURLComponent()?.url
        let expectation = expectation(description: "test1")
        NetworkingManager.shared.rickAndMortyAPICall(url: url) { result in
            switch result {
            case .failure(let err):
                print(err.description)
            case .success(let ldata):
                self.data = ldata
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5)
    }

    override func tearDownWithError() throws {
       data = nil
       url = nil
    }

    func testCharactersParseObjectModel() throws {
        XCTAssertNotNil(data)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
