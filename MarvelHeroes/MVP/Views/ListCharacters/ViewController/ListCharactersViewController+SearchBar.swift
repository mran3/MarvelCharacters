//
//  ListCharactersViewController+SearchBar.swift
//  MarvelHeroes
//
//  Created by Andres Acevedo on 2/6/23.
//  Copyright © 2023 Andrés A. All rights reserved.
//

import UIKit

extension ListCharactersViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        guard let searchText = searchBar.text else {
            return
        }
        if searchText.isEmpty {
            filteredCharacters = characters
        } else {
            filteredCharacters = characters.filter { (character: CharacterResult) -> Bool in
                guard let characterName = character.name else {
                    return false
                }
                return characterName.lowercased().contains(searchText.lowercased())
            }
        }
        
        tableView.reloadData()
    }
    
    
    
}
