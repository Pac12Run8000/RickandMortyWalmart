//
//  ComponentConstantTests.swift
//  RickAndMortyTests
//
//  Created by Michelle Grover on 6/1/22.
//

import XCTest
@testable import RickAndMortyWalmart

class ComponentConstantTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testURL() throws {
        let url = ComponentConstants.fetchCharactersURLComponent()?.url
        XCTAssertNotNil(url)
    }

    

}
