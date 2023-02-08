//
//  ListCharactersViewController.swift
//  MarvelCharacters
//
//  Created by Andrés A.
//  Copyright © 2022 Andrés A.. All rights reserved.
//

import UIKit

protocol ListCharactersView: AnyObject {
    func charactersLoaded(characters: [CharacterResult])
    func presentErrorMessage(messageText: String)
}

class ListCharactersViewController: UIViewController, ListCharactersView {
    private(set) var tableView = UITableView()
    private var searchView = UISearchBar()
    private var activityIndicator = UIActivityIndicatorView()
    private var valueToPass: String?
    private(set) var characters: [CharacterResult] = []
    var filteredCharacters: [CharacterResult] = []
    public var presenter: ListCharactersPresenterProtocol = ListCharactersPresenter()
    let heightRow: CGFloat = 50.0
    
    override func viewDidLoad() {
        presenter.attachView(self)
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
        requestInfo()
    }
    
    override func loadView() {
        super.loadView()
        self.title = "Marvel Characters"
        view.backgroundColor = UIColor(red: 217/255, green: 59/255, blue: 52/255, alpha: 1)
        navigationController?.isNavigationBarHidden = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellCharacterList")
        tableView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        setUpConstraints()
    }
    
    // This is a simple view so I decided to set the constraints here.
    // For more complex views, one can extract this information in other file.
    func setUpConstraints(){
        // Table view constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        // Activity indicator constraints
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    deinit {
        presenter.detachView(self)
    }
    
    func requestInfo(){
        showIndicator()
        presenter.getCharacters()
    }
    
    func hideIndicator(){
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = true
        }
    }
    
    func showIndicator(){
        DispatchQueue.main.async {
            self.view.bringSubviewToFront(self.activityIndicator)
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        }
    }
    
    func charactersLoaded(characters: [CharacterResult]) {
        self.characters = characters
        self.filteredCharacters = characters
        self.hideIndicator()

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
