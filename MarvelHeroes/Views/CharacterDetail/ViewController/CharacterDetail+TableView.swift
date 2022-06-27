//
//  CharacterDetail+TableView.swift
//  MarvelHeroes
//
//  Created by Andres Acevedo on 26/06/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//


import UIKit

extension CharacterDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titles.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension // self.heightRow
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
          cell.layoutIfNeeded()
      }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let textCell = tableView.dequeueReusableCell(withIdentifier: "TitleInfoTableCell", for: indexPath) as? TitleInfoTableCell else {
            print("Could not instantiate custom cell")
            return UITableViewCell()
        }
        
        guard let imageCell = tableView.dequeueReusableCell(withIdentifier: "ImageInfoTableCell", for: indexPath) as? ImageInfoTableCell else {
            print("Could not instantiate custom cell")
            return UITableViewCell()
        }
        
        switch titles[indexPath.row] {
        case .origin:
            textCell.titleLabel.text = titles[indexPath.row].rawValue
            textCell.infoLabel.text = self.character.name
            return textCell
        case .description:
            textCell.titleLabel.text = titles[indexPath.row].rawValue
            textCell.infoLabel.text = self.character.description
            if self.character.description == nil || self.character.description == "" {
                textCell.infoLabel.text = NSLocalizedString("no.description", comment: "")
            }
//            textCell.infoLabel.text = self.character.description ?? NSLocalizedString("no.description", comment: "")
            return textCell
        case .image:
            imageCell.titleLabel.text = titles[indexPath.row].rawValue
            if let path = self.character.thumbnail?.path, let fileExtension = self.character?.thumbnail?.thumbnailExtension?.rawValue {
                guard let url = URL(string: path + "." + fileExtension) else {
                    print("no URL")
                    return imageCell
                }
                
                presenter.getCharacterImage(url: url, completion: {
                    result in
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let image):
                        DispatchQueue.main.async {
                            imageCell.infoImageView.image = image
                            imageCell.layoutIfNeeded()
                        }
                    }
                })
            }
            return imageCell
        }
    }
}
