//
//  MovieCell.swift
//  tableViewApp
//
//  Created by Christelle Nieves on 6/10/21.
//

import UIKit

class MovieCell: UITableViewCell {
    
    var photo = UIImageView()
    var titleLabel = UILabel()
    var releaseDateLabel = UILabel()
    var voteAverageLabel = UILabel()
    
    let favoriteButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .black.withAlphaComponent(0.87)
        setupPhoto()
        setupTitleLabel()
        setupReleaseDateLabel()
        setupVoteAverageLabel()
        setupFavoriteButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPhoto() {
        contentView.addSubview(photo)
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.contentMode = .scaleAspectFill
        
        
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
    
    func setupReleaseDateLabel() {
        releaseDateLabel.font = UIFont.systemFont(ofSize: 14)
        releaseDateLabel.textColor = UIColor.init(white: 1, alpha: 0.77)
        releaseDateLabel.numberOfLines = 0
        releaseDateLabel.lineBreakMode = .byWordWrapping
        releaseDateLabel.minimumScaleFactor = 0.8
        releaseDateLabel.preferredMaxLayoutWidth = 200
        contentView.addSubview(releaseDateLabel)
        
        // Constraints
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            releaseDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            releaseDateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])
    }
    
    func setupVoteAverageLabel() {
        voteAverageLabel.font = UIFont.systemFont(ofSize: 14)
        voteAverageLabel.textColor = UIColor.init(white: 1, alpha: 0.77)
        contentView.addSubview(voteAverageLabel)
        
        // Constraints
        voteAverageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            voteAverageLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 10),
            voteAverageLabel.leadingAnchor.constraint(equalTo: releaseDateLabel.leadingAnchor)
        ])
    }
    
    func setupFavoriteButton() {
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .light)
        
        favoriteButton.setImage(UIImage(systemName: "plus.circle", withConfiguration: config), for: .normal)
        favoriteButton.tintColor = UIColor.init(white: 1, alpha: 0.67)
        contentView.addSubview(favoriteButton)
        
        // Constraints
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            favoriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            favoriteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

}
