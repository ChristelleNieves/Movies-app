//
//  MainViewController.swift
//  movies-app
//
//  Created by Christelle Nieves on 6/12/21.
//

import UIKit

class MainViewController: UIViewController {
    
    // Trending Today section
    private var todayLabel = UILabel()
    private var todayMoviesButton = UIButton()
    private var todayShowsButton = UIButton()
    
    // Movies section
    private var moviesLabel = UILabel()
    private var nowPlayingButton = UIButton()
    private var upcomingMoviesButton = UIButton()
    private var topRatedMoviesButton = UIButton()
    private var popularMoviesButton = UIButton()
    
    // TV Shows section
    private var showsLabel = UILabel()
    private var topRatedShowsButton = UIButton()
    private var popularShowsButton = UIButton()
    private var airingTodayButton = UIButton()
    private var currentlyAiringButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupNav()
        
        // Trending Today section
        setupTodayLabel()
        setupTodayMoviesButton()
        setupTodayShowsButton()
        
        // Movies Section
        setupMoviesLabel()
        setupNowPlayingButton()
        setupUpcomingMoviesButton()
        setupTopRatedMoviesButton()
        setupPopularMoviesButton()
        
        // TV Shows section
        setupShowsLabel()
        setupTopRatedShowsButton()
        setupPopularShowsButton()
        setupAiringTodayButton()
        setupCurrentlyAiringButton()
    }
}

// MARK: UI Setup
extension MainViewController {
    func setupMainView() {
        title = "Discover Movies & TV Shows"
        view.backgroundColor = .black
    }
    
    func setupNav() {
        navigationController?.navigationBar.tintColor = Colors.purple
    }
    
    func setupTodayLabel() {
        configureHeading(label: todayLabel, title: "Trending Today")
        
        // Constraints
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            todayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            todayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5)
        ])
    }
    
    func setupTodayMoviesButton() {
        configureButton(button: todayMoviesButton, title: "Movies")
        
        todayMoviesButton.addAction(UIAction { action in
            self.openMovieListVC(mode: MovieMode.Trending)
        }, for: .touchUpInside)
        
        // Constraints
        todayMoviesButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            todayMoviesButton.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 15),
            todayMoviesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            todayMoviesButton.widthAnchor.constraint(equalToConstant: 175),
            todayMoviesButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func setupTodayShowsButton() {
        configureButton(button: todayShowsButton, title: "TV Shows")
        
        todayShowsButton.addAction(UIAction { action in
            let listVC = TVListViewController()
            listVC.mode = TVMode.Trending
            self.navigationController?.pushViewController(listVC, animated: true)
        }, for: .touchUpInside)
        
        // Constraints
        todayShowsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            todayShowsButton.topAnchor.constraint(equalTo: todayMoviesButton.topAnchor),
            todayShowsButton.leadingAnchor.constraint(equalTo: todayMoviesButton.trailingAnchor, constant: 10),
            todayShowsButton.widthAnchor.constraint(equalToConstant: 175),
            todayShowsButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func setupMoviesLabel() {
        configureHeading(label: moviesLabel, title: "Movies")
        
        // Constraints
        moviesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moviesLabel.topAnchor.constraint(equalTo: todayShowsButton.bottomAnchor, constant: 30),
            moviesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5)
        ])
    }
    
    func setupNowPlayingButton() {
        configureButton(button: nowPlayingButton, title: "Now Playing")
        
        nowPlayingButton.addAction(UIAction { action in
            self.openMovieListVC(mode: MovieMode.NowPlaying)
        }, for: .touchUpInside)
        
        // Constraints
        nowPlayingButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nowPlayingButton.topAnchor.constraint(equalTo: moviesLabel.bottomAnchor, constant: 15),
            nowPlayingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            nowPlayingButton.widthAnchor.constraint(equalToConstant: 175),
            nowPlayingButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func setupUpcomingMoviesButton() {
        configureButton(button: upcomingMoviesButton, title: "Upcoming")
        
        upcomingMoviesButton.addAction(UIAction { action in
            self.openMovieListVC(mode: MovieMode.Upcoming)
        }, for: .touchUpInside)
        
        // Constraints
        upcomingMoviesButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            upcomingMoviesButton.topAnchor.constraint(equalTo: nowPlayingButton.topAnchor),
            upcomingMoviesButton.leadingAnchor.constraint(equalTo: nowPlayingButton.trailingAnchor, constant: 10),
            upcomingMoviesButton.widthAnchor.constraint(equalToConstant: 175),
            upcomingMoviesButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func setupTopRatedMoviesButton() {
        configureButton(button: topRatedMoviesButton, title: "Top Rated")
        
        topRatedMoviesButton.addAction(UIAction { action in
            self.openMovieListVC(mode: MovieMode.TopRated)
        }, for: .touchUpInside)
        
        // Constraints
        topRatedMoviesButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topRatedMoviesButton.topAnchor.constraint(equalTo: nowPlayingButton.bottomAnchor, constant: 15),
            topRatedMoviesButton.leadingAnchor.constraint(equalTo: nowPlayingButton.leadingAnchor),
            topRatedMoviesButton.widthAnchor.constraint(equalToConstant: 175),
            topRatedMoviesButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func setupPopularMoviesButton() {
        configureButton(button: popularMoviesButton, title: "Popular")
        
        popularMoviesButton.addAction(UIAction { action in
            self.openMovieListVC(mode: MovieMode.Popular)
        }, for: .touchUpInside)
        
        // Constraints
        popularMoviesButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            popularMoviesButton.topAnchor.constraint(equalTo: topRatedMoviesButton.topAnchor),
            popularMoviesButton.leadingAnchor.constraint(equalTo: topRatedMoviesButton.trailingAnchor, constant: 10),
            popularMoviesButton.widthAnchor.constraint(equalToConstant: 175),
            popularMoviesButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func setupShowsLabel() {
        configureHeading(label: showsLabel, title: "TV Shows")
        
        // Constraints
        showsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            showsLabel.topAnchor.constraint(equalTo: topRatedMoviesButton.bottomAnchor, constant: 30),
            showsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5)
        ])
    }
    
    func setupTopRatedShowsButton() {
        configureButton(button: topRatedShowsButton, title: "Top Rated")
        
        topRatedShowsButton.addAction(UIAction { action in
            self.openTVListVC(mode: TVMode.TopRated)
        }, for: .touchUpInside)
        
        // Constraints
        topRatedShowsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topRatedShowsButton.topAnchor.constraint(equalTo: showsLabel.bottomAnchor, constant: 15),
            topRatedShowsButton.leadingAnchor.constraint(equalTo: nowPlayingButton.leadingAnchor),
            topRatedShowsButton.widthAnchor.constraint(equalToConstant: 175),
            topRatedShowsButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func setupPopularShowsButton() {
        configureButton(button: popularShowsButton, title: "Popular")
        
        popularShowsButton.addAction(UIAction { action in
            self.openTVListVC(mode: TVMode.Popular)
        }, for: .touchUpInside)
        
        // Constraints
        popularShowsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            popularShowsButton.topAnchor.constraint(equalTo: topRatedShowsButton.topAnchor),
            popularShowsButton.leadingAnchor.constraint(equalTo: topRatedShowsButton.trailingAnchor, constant: 10),
            popularShowsButton.widthAnchor.constraint(equalToConstant: 175),
            popularShowsButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func setupAiringTodayButton() {
        configureButton(button: airingTodayButton, title: "Airing Today")
        
        airingTodayButton.addAction(UIAction { action in
            self.openTVListVC(mode: TVMode.AiringToday)
        }, for: .touchUpInside)
        
        // Constraints
        airingTodayButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            airingTodayButton.topAnchor.constraint(equalTo: topRatedShowsButton.bottomAnchor, constant: 15),
            airingTodayButton.leadingAnchor.constraint(equalTo: topRatedShowsButton.leadingAnchor),
            airingTodayButton.widthAnchor.constraint(equalToConstant: 175),
            airingTodayButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func setupCurrentlyAiringButton() {
        configureButton(button: currentlyAiringButton, title: "Currently Airing")
        
        currentlyAiringButton.addAction(UIAction { action in
            self.openTVListVC(mode: TVMode.CurrentlyAiring)
        }, for: .touchUpInside)
        
        // Constraints
        currentlyAiringButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            currentlyAiringButton.topAnchor.constraint(equalTo: airingTodayButton.topAnchor),
            currentlyAiringButton.leadingAnchor.constraint(equalTo: airingTodayButton.trailingAnchor, constant: 10),
            currentlyAiringButton.widthAnchor.constraint(equalToConstant: 175),
            currentlyAiringButton.heightAnchor.constraint(equalToConstant: 70)
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
        label.textColor = Colors.heading
        view.addSubview(label)
    }
}
