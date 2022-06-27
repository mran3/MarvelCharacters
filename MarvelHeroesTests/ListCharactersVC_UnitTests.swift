//
//  ListCharactersVCUnitTest.swift
//  Marvel Characters UnitTests
//
//  Created by Andres Acevedo on 26/01/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class ListCharactersVCUnitTest: XCTestCase {
    var subject: ListCharactersViewController!
    var mockPresenter: MockCharactersPresenter!
    override func setUpWithError() throws {
        super.setUp()
        subject = ListCharactersViewController()
        mockPresenter = MockCharactersPresenter()
        subject.presenter = mockPresenter
        subject.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Using === we check that the presenter view controller is the mock we injected.
    func testPresenterBinded() throws {
        let presenterView = subject.presenter.listCharactersView
        XCTAssert(presenterView === subject)
    }
    
    // With this we test charactersLoaded function is called and 
    func testCorrectNumberOfCharacters() throws {
        XCTAssertEqual(subject.characters.count, 2) // There are two example characters in the JSON used for tests.
    }
    
    // This test can helps us find unnecesary API requests.
    func testGetCharactersCalledOnceOnLoad() throws {
        XCTAssertEqual(mockPresenter.getTimesCalled, 1)
    }

}
