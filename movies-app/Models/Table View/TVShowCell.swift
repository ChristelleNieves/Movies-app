//
//  TVShowCell.swift
//  movies-app
//
//  Created by Christelle Nieves on 6/12/21.
//

import UIKit

class TVShowCell: UITableViewCell {
    
    var photo = UIImageView()
    let titleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupMainView()
        setupPhoto()
        setupTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: UI Setup

extension TVShowCell {
    
    func setupMainView() {
        contentView.backgroundColor = .black.withAlphaComponent(0.87)
    }
    
    func setupPhoto() {
        contentView.addSubview(photo)
        photo.clipsToBounds = true
        photo.contentMode = .scaleAspectFill
        
        // Constraints
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            photo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -190),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    func setupTitleLabel() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        titleLabel.textColor = UIColor.init(white: 1, alpha: 0.87)
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.minimumScaleFactor = 0.8
        contentView.addSubview(titleLabel)
        
        // Constraints
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
    }
}
