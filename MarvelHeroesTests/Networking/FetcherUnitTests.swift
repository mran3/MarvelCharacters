//
//  Fetcher_UnitTests.swift
//  Marvel CharactersTests
//
//  Created by Andres Acevedo on 5/03/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import XCTest
@testable import MarvelHeroes
class Fetcher_UnitTests: XCTestCase {

    var sut: Fetcher!
    var session: MockURLSession!

    override func setUpWithError() throws {
        super.setUp()
        session = MockURLSession()
        sut = Fetcher(session: session)
    }

    override func tearDownWithError() throws {
        session = nil
        sut = nil
    }

    // Very basic test to check the session uses the URL we are sending.
    func testUsesSentUrl() throws {
        let url = URL(string: "https://www.google.com/")! // Can be any URL, the MockURLSession won't do a real request.

        sut.fetchJSON(of: CharacterResult.self, from: url) {
            result in
            print(result)
        }
        XCTAssertEqual(session.lastURL, url)
    }
    
    // Very basic test to check the session dataTask gets called.
    func testResumeGetsCalled() throws {
        let url = URL(string: "https://www.github.com/")! // Can be any URL, the MockURLSession won't do a real request.

        sut.fetchJSON(of: CharacterResult.self, from: url) {
            result in
            print(result)
        }
        XCTAssertTrue(session.nextDataTask.resumeWasCalled)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
