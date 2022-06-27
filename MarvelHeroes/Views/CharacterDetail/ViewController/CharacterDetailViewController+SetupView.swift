//
//  CharacterDetailViewController+SetupView.swift
//  MarvelHeroes
//
//  Created by Andres Acevedo on 24/06/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import UIKit

extension CharacterDetailViewController {
    func setupView() {
        navigationController?.isNavigationBarHidden = false
        let bgImage = UIImage(named: "marvellogo")
        imageView.image = bgImage
        view.addSubview(imageView)
        view.addSubview(infoTable)
        view.addSubview(activityIndicator)
        setupTableView()
        setUpConstraints()
    }
    
    func setupTableView() {
        infoTable.register(TitleInfoTableCell.self, forCellReuseIdentifier: "TitleInfoTableCell")
        infoTable.register(ImageInfoTableCell.self, forCellReuseIdentifier: "ImageInfoTableCell")        
        infoTable.delegate = self
        infoTable.dataSource = self
        infoTable.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setUpConstraints(){
        //Bg Image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Table view constraints
        infoTable.translatesAutoresizingMaskIntoConstraints = false
        infoTable.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        infoTable.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        infoTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        infoTable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        // Activity indicator constraints
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
