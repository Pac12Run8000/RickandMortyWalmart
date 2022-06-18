//
//  FactoryTests.swift
//  RickAndMortyTests
//
//  Created by Michelle Grover on 6/17/22.
//

import XCTest
@testable import RickAndMortyWalmart

class FactoryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testfetchArrayOfRickAndMortyObjects() throws {
        let data = MockData.response
        var json:[RickandMortyCharacter]?
        do {
            json = try RickAndMortyCharacterFactory.shared.fetchArrayOfRickAndMortyObjects(data!)
            XCTAssertNotNil(json)
        } catch {
            XCTAssertEqual(error.localizedDescription, "The operation couldn’t be completed. (RickAndMortyWalmart.APIErrors error 2.)")
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
