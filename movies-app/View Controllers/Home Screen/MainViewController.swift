//
//  MainViewController.swift
//  movies-app
//
//  Created by Christelle Nieves on 6/12/21.
//

import UIKit

class MainViewController: UIViewController {
    
    // Trending Today section
    let todayLabel = UILabel()
    let todayMoviesButton = UIButton()
    let todayShowsButton = UIButton()
    
    // Movies section
    let moviesLabel = UILabel()
    let nowPlayingButton = UIButton()
    let upcomingMoviesButton = UIButton()
    let topRatedMoviesButton = UIButton()
    let popularMoviesButton = UIButton()
    
    // TV Shows section
    let showsLabel = UILabel()
    let topRatedShowsButton = UIButton()
    let popularShowsButton = UIButton()
    let airingTodayButton = UIButton()
    let currentlyAiringButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupNav()
        
        // Trending section
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

extension MainViewController {
    func setupMainView() {
        title = "Discover Movies & TV Shows"
        view.backgroundColor = .black
    }
    
    func setupNav() {
        navigationController?.navigationBar.tintColor = Colors.purple
        navigationController?.navigationBar.backItem?.backBarButtonItem?.tintColor = .black
    }
    
    func setupTodayLabel() {
        todayLabel.text = "Trending Today"
        todayLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 35, weight: .light)
        todayLabel.textColor = UIColor.init(white: 1, alpha: 0.60)
        view.addSubview(todayLabel)
        
        // Constraints
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            todayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            todayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5)
        ])
    }
    
    func setupTodayMoviesButton() {
        todayMoviesButton.setTitle("Movies", for: .normal)
        todayMoviesButton.backgroundColor = .black
        todayMoviesButton.layer.cornerRadius = 12
        todayMoviesButton.layer.borderColor = Colors.purple.cgColor
        todayMoviesButton.layer.borderWidth = 1
        todayMoviesButton.alpha = 0.77
        todayMoviesButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        view.addSubview(todayMoviesButton)
        
        // Add button action
        todayMoviesButton.addAction(UIAction { action in
            let listVC = MovieListViewController()
            listVC.mode = MovieMode.Trending
            self.navigationController?.pushViewController(listVC, animated: true)
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
        todayShowsButton.setTitle("TV Shows", for: .normal)
        todayShowsButton.backgroundColor = .black
        todayShowsButton.layer.cornerRadius = 12
        todayShowsButton.layer.borderWidth = 1
        todayShowsButton.layer.borderColor = Colors.purple.cgColor
        todayShowsButton.alpha = 0.77
        todayShowsButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        view.addSubview(todayShowsButton)
        
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
        moviesLabel.text = "Movies"
        moviesLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 35, weight: .light)
        moviesLabel.textColor = UIColor.init(white: 1, alpha: 0.60)
        view.addSubview(moviesLabel)
        
        // Constraints
        moviesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moviesLabel.topAnchor.constraint(equalTo: todayShowsButton.bottomAnchor, constant: 30),
            moviesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5)
        ])
    }
    
    func setupNowPlayingButton() {
        nowPlayingButton.setTitle("Now Playing", for: .normal)
        nowPlayingButton.layer.borderColor = Colors.purple.cgColor
        nowPlayingButton.layer.borderWidth = 1
        nowPlayingButton.layer.cornerRadius = 15
        nowPlayingButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        nowPlayingButton.alpha = 0.70
        view.addSubview(nowPlayingButton)
        
        nowPlayingButton.addAction(UIAction { action in
            let listVC = MovieListViewController()
            listVC.mode = MovieMode.NowPlaying
            self.navigationController?.pushViewController(listVC, animated: true)
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
        upcomingMoviesButton.setTitle("Upcoming", for: .normal)
        upcomingMoviesButton.layer.borderColor = Colors.purple.cgColor
        upcomingMoviesButton.layer.borderWidth = 1
        upcomingMoviesButton.layer.cornerRadius = 15
        upcomingMoviesButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        upcomingMoviesButton.alpha = 0.70
        view.addSubview(upcomingMoviesButton)
        
        upcomingMoviesButton.addAction(UIAction { action in
            let listVC = MovieListViewController()
            listVC.mode = MovieMode.Upcoming
            self.navigationController?.pushViewController(listVC, animated: true)
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
        topRatedMoviesButton.setTitle("Top Rated", for: .normal)
        topRatedMoviesButton.layer.borderColor = Colors.purple.cgColor
        topRatedMoviesButton.layer.borderWidth = 1
        topRatedMoviesButton.layer.cornerRadius = 15
        topRatedMoviesButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        topRatedMoviesButton.alpha = 0.70
        view.addSubview(topRatedMoviesButton)
        
        topRatedMoviesButton.addAction(UIAction { action in
            let listVC = MovieListViewController()
            listVC.mode = MovieMode.TopRated
            self.navigationController?.pushViewController(listVC, animated: true)
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
        popularMoviesButton.setTitle("Popular", for: .normal)
        popularMoviesButton.layer.borderColor = Colors.purple.cgColor
        popularMoviesButton.layer.borderWidth = 1
        popularMoviesButton.layer.cornerRadius = 15
        popularMoviesButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        popularMoviesButton.alpha = 0.70
        view.addSubview(popularMoviesButton)
        
        popularMoviesButton.addAction(UIAction { action in
            let listVC = MovieListViewController()
            listVC.mode = MovieMode.Popular
            self.navigationController?.pushViewController(listVC, animated: true)
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
        showsLabel.text = "TV Shows"
        showsLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 35, weight: .light)
        showsLabel.textColor = UIColor.init(white: 1, alpha: 0.60)
        view.addSubview(showsLabel)
        
        // Constraints
        showsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            showsLabel.topAnchor.constraint(equalTo: topRatedMoviesButton.bottomAnchor, constant: 30),
            showsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5)
        ])
    }
    
    func setupTopRatedShowsButton() {
        topRatedShowsButton.setTitle("Top Rated", for: .normal)
        topRatedShowsButton.layer.borderColor = Colors.purple.cgColor
        topRatedShowsButton.layer.borderWidth = 1
        topRatedShowsButton.layer.cornerRadius = 15
        topRatedShowsButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        topRatedShowsButton.alpha = 0.70
        view.addSubview(topRatedShowsButton)
        
        topRatedShowsButton.addAction(UIAction { action in
            let listVC = TVListViewController()
            listVC.mode = TVMode.TopRated
            self.navigationController?.pushViewController(listVC, animated: true)
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
        popularShowsButton.setTitle("Popular", for: .normal)
        popularShowsButton.layer.borderColor = Colors.purple.cgColor
        popularShowsButton.layer.borderWidth = 1
        popularShowsButton.layer.cornerRadius = 15
        popularShowsButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        popularShowsButton.alpha = 0.70
        view.addSubview(popularShowsButton)
        
        popularShowsButton.addAction(UIAction { action in
            let listVC = TVListViewController()
            listVC.mode = TVMode.Popular
            self.navigationController?.pushViewController(listVC, animated: true)
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
        airingTodayButton.setTitle("Airing Today", for: .normal)
        airingTodayButton.layer.borderColor = Colors.purple.cgColor
        airingTodayButton.layer.borderWidth = 1
        airingTodayButton.layer.cornerRadius = 15
        airingTodayButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        airingTodayButton.alpha = 0.70
        view.addSubview(airingTodayButton)
        
        airingTodayButton.addAction(UIAction { action in
            let listVC = TVListViewController()
            listVC.mode = TVMode.AiringToday
            self.navigationController?.pushViewController(listVC, animated: true)
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
        currentlyAiringButton.setTitle("Currently Airing", for: .normal)
        currentlyAiringButton.layer.borderColor = Colors.purple.cgColor
        currentlyAiringButton.layer.borderWidth = 1
        currentlyAiringButton.layer.cornerRadius = 15
        currentlyAiringButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        currentlyAiringButton.alpha = 0.70
        view.addSubview(currentlyAiringButton)
        
        currentlyAiringButton.addAction(UIAction { action in
            let listVC = TVListViewController()
            listVC.mode = TVMode.CurrentlyAiring
            self.navigationController?.pushViewController(listVC, animated: true)
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
