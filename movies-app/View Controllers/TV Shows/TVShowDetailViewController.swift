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
    private let titleLabel = UILabel()
    private let genresLabel = UILabel()
    private let languageLabel = UILabel()
    private let airDateLabel = UILabel()
    private let overviewLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupTitleLabel()
        setupGenresLabel()
        setupLanguageLabel()
        setupAirDateLabel()
        setupOverviewLabel()
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
        titleLabel.font = UIFont.boldSystemFont(ofSize: 35)
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
    
    
    func setupGenresLabel() {
        genresLabel.text = genres ?? ""
        genresLabel.font = UIFont.systemFont(ofSize: 20)
        genresLabel.textColor = UIColor.systemOrange.withAlphaComponent(0.77)
        genresLabel.numberOfLines = 0
        genresLabel.lineBreakMode = .byWordWrapping
        genresLabel.minimumScaleFactor = 0.8
        genresLabel.preferredMaxLayoutWidth = 200
        view.addSubview(genresLabel)
        
        // Constraints
        genresLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            genresLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            genresLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            genresLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    func setupLanguageLabel() {
        languageLabel.text = "Original Language: \(show?.original_language ?? "")"
        languageLabel.font = UIFont.systemFont(ofSize: 15)
        languageLabel.textColor = UIColor.init(white: 1, alpha: 0.67)
        view.addSubview(languageLabel)
        
        // Constraints
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            languageLabel.topAnchor.constraint(equalTo: genresLabel.bottomAnchor, constant: 12),
            languageLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])
    }
    
    func setupAirDateLabel() {
        airDateLabel.text = "First Air Date: \(show?.first_air_date ?? "")"
        airDateLabel.font = UIFont.systemFont(ofSize: 15)
        airDateLabel.textColor = UIColor.init(white: 1, alpha: 0.67)
        view.addSubview(airDateLabel)
        
        // Constraints
        airDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            airDateLabel.topAnchor.constraint(equalTo: languageLabel.bottomAnchor, constant: 12),
            airDateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])
    }
    
    func setupOverviewLabel() {
        overviewLabel.text = show?.overview ?? ""
        overviewLabel.font = UIFont.systemFont(ofSize: 15)
        overviewLabel.textColor = UIColor.init(white: 1, alpha: 0.77)
        overviewLabel.adjustsFontSizeToFitWidth = true
        overviewLabel.numberOfLines = 0
        view.addSubview(overviewLabel)
        
        // Constraints
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: airDateLabel.bottomAnchor, constant: 12),
            overviewLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            overviewLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
}
