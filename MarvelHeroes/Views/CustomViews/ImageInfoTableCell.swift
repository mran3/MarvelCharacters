//
//  TitleInfoTableCell.swift
//  Marvel Characters
//
//  Created by Andres Acevedo on 10/01/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import UIKit

class ImageInfoTableCell: UITableViewCell {
    let titleLabel = UILabel()
    let infoImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(titleLabel)
        
        contentView.addSubview(infoImageView)
        
        infoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        self.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            infoImageView.widthAnchor.constraint(lessThanOrEqualTo: contentView.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            infoImageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            infoImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 200),
            infoImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            infoImageView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            infoImageView.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            titleLabel.widthAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
