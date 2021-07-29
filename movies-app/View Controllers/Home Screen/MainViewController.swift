//
//  MainViewController.swift
//  movies-app
//
//  Created by Christelle Nieves on 6/12/21.
//

import UIKit

class MainViewController: UIViewController {
    
    // Top Section
    let topLabel = UILabel()
    let searchButton = UIButton()
    
    // Trending Today section
    private var trendingLabel = UILabel()
    private let trendingView = TrendingView()
    
    // Movies section
    private var moviesLabel = UILabel()
    private var moviesView = MoviesView()
    
    // TV Shows section
    private var showsLabel = UILabel()
    private var showsView = TVShowsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupTopLabel()
        setupSearchButton()
        setupTrendingLabel()
        setupTrendingView()
        setupMoviesLabel()
        setupMoviesView()
        setupShowsLabel()
        setupShowsView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

// MARK: UI Setup
extension MainViewController {
    func setupMainView() {
        view.backgroundColor = AppColor.AppDarkBackground
    }
    
    func setupTopLabel() {
        topLabel.text = "Discover Movies & TV Shows"
        topLabel.font = UIFont.systemFont(ofSize: 27, weight: .medium)
        topLabel.textColor = AppColor.AppAccentHotPink
        topLabel.numberOfLines = 0
        topLabel.lineBreakMode = .byWordWrapping
        view.addSubview(topLabel)
        
        // Constraints
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            topLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            topLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.70)
        ])
    }
    
    func setupSearchButton() {
        let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .medium)
        searchButton.setImage(UIImage(systemName: "magnifyingglass", withConfiguration: config), for: .normal)
        searchButton.imageView?.tintColor = AppColor.AppSubheadingText
        view.addSubview(searchButton)
        
        // Constraints
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: topLabel.topAnchor),
            searchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            searchButton.heightAnchor.constraint(equalToConstant: 50),
            searchButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupTrendingLabel() {
        configureHeading(label: trendingLabel, title: "Trending Today")
        
        // Setup the flame icon
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular)
        let flameIcon = UIImageView(image: UIImage(systemName: "flame.fill", withConfiguration: config))
        flameIcon.tintColor = AppColor.AppAccentHotPink
        flameIcon.contentMode = .scaleAspectFit
        view.addSubview(flameIcon)
        
        // Icon constraints
        flameIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            flameIcon.leadingAnchor.constraint(equalTo: trendingLabel.trailingAnchor, constant: 10),
            flameIcon.topAnchor.constraint(equalTo: trendingLabel.topAnchor),
            flameIcon.bottomAnchor.constraint(equalTo: trendingLabel.bottomAnchor)
        ])
        
        // Constraints
        trendingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            trendingLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 40),
            trendingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    func setupTrendingView() {
        view.addSubview(trendingView)
        
        // Set movies button action
        trendingView.moviesButton.addAction(UIAction { action in
            self.gotoMovieList(mode: MovieMode.Trending)
        }, for: .touchUpInside)
        
        // Set tv shows button action
        trendingView.showsButton.addAction(UIAction { action in
            self.gotoTVShowList(mode: TVMode.Trending)
        }, for: .touchUpInside)
        
        // Constraints
        trendingView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            trendingView.topAnchor.constraint(equalTo: trendingLabel.bottomAnchor, constant: 20),
            trendingView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            trendingView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            trendingView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/9)
        ])
    }
    
    func setupMoviesLabel() {
        configureHeading(label: moviesLabel, title: "Movies")
        
        // Setup the flame icon
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular)
        let movieIcon = UIImageView(image: UIImage(systemName: "film", withConfiguration: config))
        movieIcon.tintColor = AppColor.AppAccentHotPink
        movieIcon.contentMode = .scaleAspectFit
        view.addSubview(movieIcon)
        
        // Icon constraints
        movieIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieIcon.leadingAnchor.constraint(equalTo: moviesLabel.trailingAnchor, constant: 10),
            movieIcon.topAnchor.constraint(equalTo: moviesLabel.topAnchor),
            movieIcon.bottomAnchor.constraint(equalTo: moviesLabel.bottomAnchor)
        ])
        
        // Constraints
        moviesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moviesLabel.topAnchor.constraint(equalTo: trendingView.bottomAnchor, constant: 30),
            moviesLabel.leadingAnchor.constraint(equalTo: trendingLabel.leadingAnchor)
        ])
    }
    
    func setupMoviesView() {
        view.addSubview(moviesView)
        
        // Set button actions
        moviesView.nowPlayingButton.addAction(UIAction { action in
            self.gotoMovieList(mode: MovieMode.NowPlaying)
        }, for: .touchUpInside)
        
        moviesView.upcomingButton.addAction(UIAction { action in
            self.gotoMovieList(mode: MovieMode.Upcoming)
        }, for: .touchUpInside)
        
        moviesView.topRatedButton.addAction(UIAction { action in
            self.gotoMovieList(mode: MovieMode.TopRated)
        }, for: .touchUpInside)
        
        moviesView.popularButton.addAction(UIAction { action in
            self.gotoMovieList(mode: MovieMode.Popular)
        }, for: .touchUpInside)
        
        // Constraints
        moviesView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moviesView.topAnchor.constraint(equalTo: moviesLabel.bottomAnchor, constant: 20),
            moviesView.leadingAnchor.constraint(equalTo: trendingLabel.leadingAnchor),
            moviesView.trailingAnchor.constraint(equalTo: trendingView.trailingAnchor),
            moviesView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/5.7)
        ])
    }
    
    func setupShowsLabel() {
        configureHeading(label: showsLabel, title: "TV Shows")
        
        // Setup the flame icon
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular)
        let showsIcon = UIImageView(image: UIImage(systemName: "tv", withConfiguration: config))
        showsIcon.tintColor = AppColor.AppAccentHotPink
        showsIcon.contentMode = .scaleAspectFit
        view.addSubview(showsIcon)
        
        // Icon constraints
        showsIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            showsIcon.leadingAnchor.constraint(equalTo: showsLabel.trailingAnchor, constant: 10),
            showsIcon.topAnchor.constraint(equalTo: showsLabel.topAnchor),
            showsIcon.bottomAnchor.constraint(equalTo: showsLabel.bottomAnchor)
        ])
        
        // Constraints
        showsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            showsLabel.topAnchor.constraint(equalTo: moviesView.bottomAnchor, constant: 30),
            showsLabel.leadingAnchor.constraint(equalTo: trendingLabel.leadingAnchor)
        ])
    }
    
    func setupShowsView() {
        view.addSubview(showsView)
        
        // Add button actions
        showsView.topRatedButton.addAction(UIAction { action in
            self.gotoTVShowList(mode: TVMode.TopRated)
        }, for: .touchUpInside)
        
        showsView.popularButton.addAction(UIAction { action in
            self.gotoTVShowList(mode: TVMode.Popular)
        }, for: .touchUpInside)
        
        showsView.airingTodayButton.addAction(UIAction { action in
            self.gotoTVShowList(mode: TVMode.AiringToday)
        }, for: .touchUpInside)
        
        showsView.currentlyAiringButton.addAction(UIAction { action in
            self.gotoTVShowList(mode: TVMode.CurrentlyAiring)
        }, for: .touchUpInside)
        
        // Constraints
        showsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            showsView.topAnchor.constraint(equalTo: showsLabel.bottomAnchor, constant: 20),
            showsView.leadingAnchor.constraint(equalTo: trendingView.leadingAnchor),
            showsView.trailingAnchor.constraint(equalTo: trendingView.trailingAnchor),
            showsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/5.7)
        ])
    }
}

// MARK: Helper Functions
extension MainViewController {
    
    // Open a TVListViewController and set the mode
    func openTVListVC(mode: TVMode) {
        let listVC = TVListViewController()
        listVC.mode = mode
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
    // Open a MovieListViewController and set the mode
    func openMovieListVC(mode: MovieMode) {
        let listVC = MovieListViewController()
        listVC.mode = mode
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
    // Configure the appearance of a button and add it to the main view
    func configureButton(button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.layer.borderColor = Colors.purple.cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 30
        button.contentEdgeInsets = Insets.button
        button.alpha = Alphas.button
        view.addSubview(button)
    }
    
    // Configure the appearance of a label and add it to  the main view
    func configureHeading(label: UILabel, title: String) {
        label.text = title
        label.font = Fonts.heading
        label.textColor = AppColor.AppHeadingText
        view.addSubview(label)
    }
}
