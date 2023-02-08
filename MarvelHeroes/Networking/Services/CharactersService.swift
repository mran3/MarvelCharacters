//
//  CharactersService.swift
//  MarvelCharacters
//
//  Created by Andres A. on 24/06/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import UIKit

protocol CharactersServiceProtocol {
    func getCharacters(completion: @escaping FetchResultCallback<CharacterResponse>)
}

class CharactersService: CharactersServiceProtocol {
    private let marvelTarget: MarvelTarget = .listCharacters
    private let jsonParser = Fetcher()
    func getCharacters(completion: @escaping FetchResultCallback<CharacterResponse>) {
        let parameters = ["limit": "100"]
        let jsonURL = marvelTarget.makeURL(parameters: parameters)
        jsonParser.fetchJSON(of: CharacterResponse.self, from: jsonURL!) { result in
            completion(result)
        }
    }
    
}
