//
//  MockListCharactersPresenter.swift
//  Marvel Characters UnitTests
//
//  Created by Andres Acevedo on 26/01/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import Foundation
@testable import MarvelHeroes

class MockCharactersPresenter: ListCharactersPresenter {
    var getTimesCalled = 0
    
    override func getCharacters() {
        print("get Characters")
        getTimesCalled += 1
        let charactersService = MockCharactersService()
        charactersService.getCharacters {
            [weak self] result in
            guard let self = self else {
                print("No self reference found")
                return
            }
            switch result {
            case .failure(let error):
                if error is DataError {
                    print("DataError = \(error)")
                } else {
                    print(error.localizedDescription)
                }
                self.view?.presentErrorMessage(messageText: NSLocalizedString("api.error", comment: ""))
            case .success(let response):
                if let characters:[CharacterResult] = response.data?.results {
                    self.view?.charactersLoaded(characters: characters)
                }                
            }

        }
    }
}
