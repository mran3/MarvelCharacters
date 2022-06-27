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
    func presentErrorMsg(messageText: String)
}

class ListCharactersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ListCharactersView {
    private(set) var tableView = UITableView()
    private var activityIndicator = UIActivityIndicatorView()
    private var valueToPass: String?
    private(set) var characters: [CharacterResult] = []
    public var presenter: ListCharactersPresenterProtocol = ListCharactersPresenter()
    private let heightRow: CGFloat = 50.0
    
    override func viewDidLoad() {
        presenter.attachView(self)
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        requestInfo()
    }
    
    // This is a simple view so decided to set the constraints here.
    // For bigger projects, one can extract this information in other
    // function or even other files.
    override func loadView() {
        super.loadView()
        self.title = "Marvel Characters"
        if let bgImage = UIImage(named: "marvel") {
            view.backgroundColor = UIColor(patternImage: bgImage)
        }
        navigationController?.isNavigationBarHidden = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellProduct")
        tableView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        setUpConstraints()
    }
    
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
    
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
           return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "CellProduct", for: indexPath)
        cell.textLabel?.text = self.characters[indexPath.row].name
        cell.backgroundColor = .clear
          return cell
      }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.heightRow
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = self.characters[indexPath.row]
        let vc = CharacterDetailViewController(character: character)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func charactersLoaded(characters: [CharacterResult]) {
        self.characters = characters
        self.hideIndicator()

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }

        
    }    
}
