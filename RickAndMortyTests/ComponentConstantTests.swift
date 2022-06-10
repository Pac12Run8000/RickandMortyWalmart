//
//  ComponentConstantTests.swift
//  RickAndMortyTests
//
//  Created by Michelle Grover on 6/1/22.
//

import XCTest
@testable import RickAndMortyWalmart

class ComponentConstantTests: XCTestCase {

    var queryItems:[URLQueryItem]?

    override func setUpWithError() throws {
        queryItems = [
            URLQueryItem(name: "name", value: "Marty MckFly"),
            URLQueryItem(name: "dojo", value: "Miyago Do"),
            URLQueryItem(name: "gym", value: "Eagle Fang")
        ]
    }

    override func tearDownWithError() throws {
        queryItems = nil
    }
    
    func testDoesUrlConstantReturnURLNoURLItems() throws {
        let url = ComponentConstants.fetchCharactersURLComponent()?.url
        XCTAssertEqual("https://rickandmortyapi.com/api/character", url?.absoluteString)
    }
    
    func testDoesUrlConstantReturnURLWithURLItems() throws {
        let url = ComponentConstants.fetchCharactersURLComponent(queries: queryItems)?.url
        XCTAssertEqual("https://rickandmortyapi.com/api/character?name=Marty%20MckFly&dojo=Miyago%20Do&gym=Eagle%20Fang", url?.absoluteString)
    }
    
    func testURL() throws {
        let url = ComponentConstants.fetchCharactersURLComponent()?.url
        XCTAssertNotNil(url)
    }

    

}
