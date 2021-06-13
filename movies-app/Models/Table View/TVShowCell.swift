//
//  TVShowCell.swift
//  movies-app
//
//  Created by Christelle Nieves on 6/12/21.
//

import UIKit

class TVShowCell: UITableViewCell {
    
    var photo = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupMainView()
        setupPhoto()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TVShowCell {
    
    func setupMainView() {
        contentView.backgroundColor = .black.withAlphaComponent(0.87)
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
}
