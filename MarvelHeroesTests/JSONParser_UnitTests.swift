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

    var subject: Fetcher!
    var session: MockURLSession!

    override func setUpWithError() throws {
        super.setUp()
        session = MockURLSession()
        subject = Fetcher(session: session)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Very basic test to check the session uses the URL we are sending.
    func testUsesSentUrl() throws {
        let url = URL(string: "https://www.talentomobile.com/")!

        subject.fetchJSON(of: CharacterResult.self, from: url) {
            result in
            print(result)
        }
        XCTAssertEqual(session.lastURL, url)
    }
    
    // Very basic test to check the session dataTask gets called.
    func testResumeGetsCalled() throws {
        let url = URL(string: "http://turtle-techies.com")!

        subject.fetchJSON(of: CharacterResult.self, from: url) {
            result in
            print(result)
        }
        XCTAssertEqual(session.nextDataTask.resumeWasCalled, true)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
