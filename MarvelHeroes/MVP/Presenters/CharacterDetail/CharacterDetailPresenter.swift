//
//  CharacterDetailPresenter.swift
//  MarvelHeroes
//
//  Created by Andres Acevedo on 26/06/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import UIKit

// I use protocols so Unit testing can be done easily using Mock objects.
protocol CharacterDetailPresenterProtocol: AnyObject {
    var characterDetailView: CharacterDetailView? { get }
    func attachView(_ viewController: CharacterDetailView)
    func detachView(_ viewController: CharacterDetailView)
    func getCharacterImage(url: URL, completion: @escaping FetchResultCallback<UIImage>)
}

class CharacterDetailPresenter: CharacterDetailPresenterProtocol {
    weak var characterDetailView: CharacterDetailView?
    let fetcher = Fetcher()

    func attachView(_ viewController: CharacterDetailView) {
        self.characterDetailView = viewController
    }
    
    func detachView(_ viewController: CharacterDetailView) {
        self.characterDetailView = nil
    }
    
    func getCharacterImage(url: URL, completion: @escaping FetchResultCallback<UIImage>) {
        fetcher.fetchImage(from: url, completion: completion)
    }
    
    
}
