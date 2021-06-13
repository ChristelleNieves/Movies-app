//
//  MovieDetailViewController.swift
//  tableViewApp
//
//  Created by Christelle Nieves on 6/11/21.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movie: MovieDetails?
    var genres: String?
    
    private let movieTitleLabel = UILabel()
    private let movieGenresLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private let movieOverviewLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupMovieTitleLabel()
        setupMovieGenresLabel()
        setupReleaseDateLabel()
        setupMovieOverviewLabel()
    }
}

// MARK: UI Setup
extension MovieDetailViewController {
    
    func setupMainView() {
        title = "Movie Details"
        view.backgroundColor = .black.withAlphaComponent(0.95)
    }
    
    func setupMovieTitleLabel() {
        movieTitleLabel.text = movie?.title ?? ""
        movieTitleLabel.font = UIFont.boldSystemFont(ofSize: 35)
        movieTitleLabel.textColor = UIColor.init(white: 1, alpha: 0.87)
        movieTitleLabel.adjustsFontSizeToFitWidth = true
        movieTitleLabel.numberOfLines = 0
        view.addSubview(movieTitleLabel)
        
        // Constraints
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            movieTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            movieTitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    func setupMovieGenresLabel() {
        movieGenresLabel.text = genres ?? ""
        movieGenresLabel.font = UIFont.systemFont(ofSize: 20)
        movieGenresLabel.textColor = UIColor.systemOrange.withAlphaComponent(0.77)
        movieGenresLabel.numberOfLines = 0
        movieGenresLabel.lineBreakMode = .byWordWrapping
        movieGenresLabel.minimumScaleFactor = 0.8
        movieGenresLabel.preferredMaxLayoutWidth = 200
        view.addSubview(movieGenresLabel)
        
        // Constraints
        movieGenresLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieGenresLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 12),
            movieGenresLabel.leadingAnchor.constraint(equalTo: movieTitleLabel.leadingAnchor),
            movieGenresLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    func setupReleaseDateLabel() {
        releaseDateLabel.text = "Release Date: \(movie?.release_date ?? "")"
        releaseDateLabel.font = UIFont.systemFont(ofSize: 15)
        releaseDateLabel.textColor = UIColor.init(white: 1, alpha: 0.67)
        view.addSubview(releaseDateLabel)
        
        // Constraints
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            releaseDateLabel.topAnchor.constraint(equalTo: movieGenresLabel.bottomAnchor, constant: 12),
            releaseDateLabel.leadingAnchor.constraint(equalTo: movieTitleLabel.leadingAnchor)
        ])
    }
    
    func setupMovieOverviewLabel() {
        movieOverviewLabel.text = movie?.overview ?? ""
        movieOverviewLabel.font = UIFont.systemFont(ofSize: 15)
        movieOverviewLabel.textColor = UIColor.init(white: 1, alpha: 0.77)
        movieOverviewLabel.adjustsFontSizeToFitWidth = true
        movieOverviewLabel.numberOfLines = 0
        view.addSubview(movieOverviewLabel)
        
        // Constraints
        movieOverviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieOverviewLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 12),
            movieOverviewLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            movieOverviewLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
}
