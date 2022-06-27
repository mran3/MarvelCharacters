//
//  ListCharactersPresenter_UnitTests.swift
//  Marvel Characters UnitTests
//
//  Created by Andres Acevedo on 28/02/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class ListCharactersPresenter_UnitTests: XCTestCase {
    
    var subject: ListCharactersPresenter!
    var mockCharactersService: MockCharactersService!
    var mockListCharacterVC: MockListCharactersVC!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        subject = ListCharactersPresenter()
        mockCharactersService = MockCharactersService()
        subject.charactersService = mockCharactersService
        mockListCharacterVC = MockListCharactersVC()
        subject.attachView(mockListCharacterVC)
    }

    func testFailingServiceTest() throws {
        mockCharactersService.makeRequestFail = true
        subject.getCharacters()
        XCTAssertTrue(mockListCharacterVC.presentErrorMsgCalled)
    }

}
