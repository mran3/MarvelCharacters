//
//  ListCharactersViewControllerUnitTest.swift
//  Marvel Characters UnitTests
//
//  Created by Andres Acevedo on 26/01/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class ListCharactersViewControllerUnitTests: XCTestCase {
    var sut: ListCharactersViewController!
    var mockPresenter: MockCharactersPresenter!
    
    override func setUpWithError() throws {
        super.setUp()
        sut = ListCharactersViewController()
        mockPresenter = MockCharactersPresenter()
        sut.presenter = mockPresenter
        _ = sut.view // This triggers the ViewController lifecycle.
    }

    override func tearDownWithError() throws {
        sut = nil
        mockPresenter = nil
    }

    // Using === we check that the presenter view controller is the mock we injected.
    func testPresenterBinded() throws {
        let presenterView = sut.presenter.view
        XCTAssert(presenterView === sut)
    }
    
    func testCorrectNumberOfCharacters() throws {
        XCTAssertEqual(sut.characters.count, 2) // There are two example characters in the JSON used for tests.
    }
    
    // This test can helps us find unnecesary API requests.
    func testGetCharactersCalledOnceOnLoad() throws {
        XCTAssertEqual(mockPresenter.getTimesCalled, 1)
    }

}
