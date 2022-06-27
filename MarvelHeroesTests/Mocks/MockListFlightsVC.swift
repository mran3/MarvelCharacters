//
//  MockListCharactersVC.swift
//  Marvel Characters UnitTests
//
//  Created by Andres Acevedo on 3/03/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import Foundation
@testable import MarvelHeroes


class MockListCharactersVC: ListCharactersView {
    var charactersLoadedCalled = false
    var presentErrorMsgCalled = false
    
    func charactersLoaded(characters: [CharacterResult]) {
        charactersLoadedCalled = true
    }
    
    func presentErrorMsg(messageText: String) {
        presentErrorMsgCalled = true
    }
    
    
}
