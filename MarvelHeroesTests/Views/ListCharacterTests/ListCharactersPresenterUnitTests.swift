//
//  ListCharactersPresenterUnitTests.swift
//  Marvel Characters UnitTests
//
//  Created by Andres Acevedo on 28/02/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class ListCharactersPresenterUnitTests: XCTestCase {
    
    var sut: ListCharactersPresenter!
    var mockCharactersService: MockCharactersService!
    var mockListCharacterVC: MockListCharactersVC!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = ListCharactersPresenter()
        mockCharactersService = MockCharactersService()
        sut.charactersService = mockCharactersService
        mockListCharacterVC = MockListCharactersVC()
        sut.attachView(mockListCharacterVC)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        mockCharactersService = nil        
        mockListCharacterVC = nil
    }

    func testFailingServiceTest() throws {
        mockCharactersService.makeRequestFail = true
        sut.getCharacters()
        XCTAssertTrue(mockListCharacterVC.presentErrorMsgCalled)
    }

}
