//
//  TitleInfoTableCell.swift
//  Marvel Characters
//
//  Created by Andres Acevedo on 10/01/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import UIKit

class TitleInfoTableCell: UITableViewCell {
    let titleLabel = UILabel()
    let infoLabel = UILabel()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(titleLabel)
        contentView.addSubview(infoLabel)
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.numberOfLines = 0
        infoLabel.lineBreakMode = .byWordWrapping
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        self.backgroundColor = .clear

        NSLayoutConstraint.activate([
            infoLabel.widthAnchor.constraint(lessThanOrEqualTo: contentView.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
            infoLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            infoLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            infoLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            infoLabel.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            titleLabel.widthAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4),
            titleLabel.heightAnchor.constraint(equalToConstant: 80),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
        
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
