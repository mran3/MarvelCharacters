//
//  ListCharactersViewController+TableView.swift
//  MarvelHeroes
//
//  Created by Andres Acevedo on 2/8/23.
//  Copyright © 2023 Andrés A. All rights reserved.
//

import UIKit

extension ListCharactersViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredCharacters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellCharacterList", for: indexPath)
        cell.textLabel?.text = self.filteredCharacters[indexPath.row].name
        cell.textLabel?.font = UIFont.systemFont(ofSize: 22)
        cell.backgroundColor = .clear
        return cell
      }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.heightRow
    }

    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let bgColorView = UIView()
            bgColorView.backgroundColor = .rowHighlight
            cell.selectedBackgroundView = bgColorView
            cell.backgroundColor = .rowHighlight
            cell.textLabel?.textColor = .white
        }
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let bgColorView = UIView()
        bgColorView.backgroundColor = .clear
        cell?.selectedBackgroundView = bgColorView
        cell?.backgroundColor = .clear
        cell?.textLabel?.textColor = .black
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = self.characters[indexPath.row]
        let vc = CharacterDetailViewController(character: character)
        self.navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
