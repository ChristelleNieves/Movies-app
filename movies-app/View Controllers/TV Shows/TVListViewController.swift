//
//  TVListViewController.swift
//  movies-app
//
//  Created by Christelle Nieves on 6/12/21.
//

import UIKit
import Combine

// Displays a UITableView populated with TVCells
class TVListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var mode: TVMode = TVMode.Trending
    var cancellables = Set<AnyCancellable>()
    var cachedImages = [IndexPath: UIImage]()
    var genres = [Genre]()
    var shows = [ShowDetails]()
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTVShows()
        fetchGenres()
        setupMainView()
        setupTableView()
    }
    
    // Return the number of cells in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count
    }
    
    // Return a configured cell holding TV Show details
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVShowCell", for: indexPath) as! TVShowCell
        let urlString = "\(IMAGE_BASE_URL)/original/\(shows[indexPath.row].poster_path)"
        
        // Fetch the image associated with the current TV show
        fetchImage(at: urlString, for: indexPath, cell: cell)
        cell.titleLabel.text = shows[indexPath.row].name
        
        // If the show doesn't have a vote average, display "not yet rated"
        if shows[indexPath.row].vote_average == 0 {
            cell.voteAverageLabel.text = "Rating: Not Yet Rated"
        }
        else {
            cell.voteAverageLabel.text = "Rating: \(shows[indexPath.row].vote_average)/10"
        }
        
        return cell
    }
    
    // Open a TVShowDetailViewController when a cell is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = TVShowDetailViewController()
        let navVC = UINavigationController(rootViewController: detailVC)
        
        // Pass the selected TV show and its associated genres to the detail VC
        detailVC.show = shows[indexPath.row]
        detailVC.genres = getCurrenShowGenres(show: shows[indexPath.row]).joined(separator: ", ")
        
        // Present the VC
        present(navVC, animated: true, completion: nil)
    }
}

// MARK: UI Setup

extension TVListViewController {
    
    func setupMainView() {
        // Set the title of the TVListViewController according to the current mode
        switch mode {
        case .Trending:
            title = "Today's Trending TV Shows"
        case .TopRated:
            title = "Top Rated TV Shows"
        case .Popular:
            title = "Popular TV Shows"
        case .AiringToday:
            title = "TV Shows Airing Today"
        case .CurrentlyAiring:
            title = "TV Shows Currently Airing"
        }
    }
    
    // Configure the table view and set constraints
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TVShowCell.self, forCellReuseIdentifier: "TVShowCell")
        tableView.rowHeight = 300
        tableView.backgroundColor = .black.withAlphaComponent(0.87)
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        view.addSubview(tableView)
        
        // Constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
