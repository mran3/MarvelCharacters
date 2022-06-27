//
//  CharacterDetailViewController.swift
//  Marvel Characters
//
//  Created by Andres Acevedo on 9/01/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import UIKit

enum DetailSections: String {
    case origin = "Name"
    case description = "Description"
    case image = "Image"
}

protocol CharacterDetailView: AnyObject {
    var character: CharacterResult! {get}
}

class CharacterDetailViewController: UIViewController, CharacterDetailView {
    var presenter: CharacterDetailPresenterProtocol = CharacterDetailPresenter()
    let imageView = UIImageView()
    let activityIndicator = UIActivityIndicatorView()
    let label = UILabel()
    let infoTable = UITableView()
    let heightRow: CGFloat = 100.0
    let titles: [DetailSections] = [.origin, .description, .image]
    let fetcher = Fetcher()
    var character: CharacterResult!
    
    init(character: CharacterResult) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        presenter.attachView(self)
        setupView()
    }
    deinit {
        presenter.detachView(self)
    }
}
