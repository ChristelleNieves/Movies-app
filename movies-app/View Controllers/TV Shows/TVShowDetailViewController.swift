//
//  TVShowDetailViewController.swift
//  movies-app
//
//  Created by Christelle Nieves on 6/12/21.
//

import UIKit

class TVShowDetailViewController: UIViewController {

    var show: ShowDetails?
    var genres: String?
    
    let titleLabel = UILabel()
    let genresLabel = UILabel()
    let overviewLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupTitleLabel()
    }

}

// MARK: UI Setup

extension TVShowDetailViewController {
    
    func setupMainView() {
        title = "TV Show Details"
        view.backgroundColor = .black.withAlphaComponent(0.95)
    }
    
    func setupTitleLabel() {
        titleLabel.text = show?.name ?? ""
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textColor = UIColor.init(white: 1, alpha: 0.87)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.numberOfLines = 0
        view.addSubview(titleLabel)
        
        // Constraints
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
}
