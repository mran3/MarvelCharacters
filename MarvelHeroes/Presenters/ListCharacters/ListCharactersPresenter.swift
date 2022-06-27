//
//  ListLocationsPresenter.swift
//  MarvelCharacters
//
//  Copyright © 2022 Andrés A. All rights reserved.
//

import Foundation

// I use protocols so Unit testing can be done easily using Mock objects.
protocol ListCharactersPresenterProtocol: AnyObject {
    var listCharactersView: ListCharactersView? { get }
    func attachView(_ viewController: ListCharactersView)
    func detachView(_ viewController: ListCharactersView)
    func getCharacters()
}

class ListCharactersPresenter: ListCharactersPresenterProtocol {
    weak var listCharactersView: ListCharactersView?
    var charactersService: CharactersServiceProtocol = CharactersService()
    
    func attachView(_ viewController: ListCharactersView){
        self.listCharactersView = viewController
    }
    
    func detachView(_ viewController: ListCharactersView){
        self.listCharactersView = nil
    }
    
    func getCharacters() {
        charactersService.getCharacters { [weak self] result in
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
                self.listCharactersView?.presentErrorMsg(messageText: NSLocalizedString("api.error", comment: ""))
            case .success(let response):
                let charactersData: [CharacterResult] = response.data?.results ?? []
                self.listCharactersView?.charactersLoaded(characters: charactersData)
            }
        }
    }
}


