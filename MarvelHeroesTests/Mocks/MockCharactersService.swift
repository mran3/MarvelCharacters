//
//  MockCharactersService.swift
//  Marvel Characters UnitTests
//
//  Created by Andres Acevedo on 27/01/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import UIKit
@testable import MarvelHeroes


class MockCharactersService: CharactersServiceProtocol {
    
    private let jsonParser = Fetcher(session: MockURLSession())
    var makeRequestFail = false
    
    func getCharacters(completion: @escaping FetchResultCallback<CharacterResponse>) {
        if makeRequestFail {
            completion(.failure(ServiceError.getError("Could not get characters")))
        } else {
            let jsonData = readLocalFile(forName: "characters")
            jsonParser.decodeJson(data: jsonData, completion: completion)
        }
    }
    
    
    private func readLocalFile(forName name: String) -> Data?  {
        do {
            if let bundlePath = Bundle(for: type(of: self))
                                .path(forResource: name,
                                ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
}
    
