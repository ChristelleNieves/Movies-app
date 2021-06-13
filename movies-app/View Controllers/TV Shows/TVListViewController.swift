//
//  TVListViewController.swift
//  movies-app
//
//  Created by Christelle Nieves on 6/12/21.
//

import UIKit
import Combine

class TVListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var mode: TVMode = TVMode.Trending
    private var cancellables = Set<AnyCancellable>()
    private var cachedImages = [IndexPath: UIImage]()
    private var genres = [Genre]()
    private var shows = [ShowDetails]()
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTVShows()
        fetchGenres()
        setupMainView()
        setupTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVShowCell", for: indexPath) as! TVShowCell
        let urlString = "\(IMAGE_BASE_URL)/\(IMAGE_SIZE)/\(shows[indexPath.row].poster_path)"
        
        fetchImage(at: urlString, for: indexPath, cell: cell)
        cell.titleLabel.text = shows[indexPath.row].name
        
        if shows[indexPath.row].vote_average == 0 {
            cell.voteAverageLabel.text = "Rating: Not Yet Rated"
        }
        else {
            cell.voteAverageLabel.text = "Rating: \(shows[indexPath.row].vote_average)/10"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = TVShowDetailViewController()
        let navVC = UINavigationController(rootViewController: detailVC)
        
        detailVC.show = shows[indexPath.row]
        detailVC.genres = getCurrenShowGenres(show: shows[indexPath.row]).joined(separator: ", ")
        
        present(navVC, animated: true, completion: nil)
    }

}

// MARK: UI Setup

extension TVListViewController {
    
    func setupMainView() {
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


// MARK: API

extension TVListViewController {
    
    func fetchTVShows() {
        let urlString = API_Request.setShowRequestUrl(mode: mode)
        
        // Make the request to the API
        API_Request.fetchShowsFromAPI(urlString: urlString)
            .sink { results in
                self.shows = results
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            .store(in: &cancellables)
    }
    
    // Fetch the image for the corresponding movie
    func fetchImage(at endpoint: String, for indexPath: IndexPath, cell: TVShowCell) {
        guard let url = URL(string: endpoint) else { return }
        
        if let cachedImage = cachedImages[indexPath] {
            cell.photo.image = cachedImage
        }
        else {
            URLSession.shared.dataTaskPublisher(for: url)
                .map(\.data)
                .map { data in
                    return UIImage(data: data)
                }
                .replaceError(with: nil)
                .receive(on: DispatchQueue.main)
                .sink { image in
                    cell.photo.image = image
                    self.cachedImages[indexPath] = image
                }
                .store(in: &cancellables)
        }
    }
    
    // Fetches all possible movie genres from the api
    func fetchGenres() {
        API_Request.fetchGenresWithCombine()
            .sink { genres in
                self.genres = genres
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            .store(in: &cancellables)
    }
    
    // Returns an array holding all the genres that pertain to the current movie
    func getCurrenShowGenres(show: ShowDetails) -> [String] {
        var currentGenres: [String] = []
        
        for genre in genres {
            if show.genre_ids.contains(genre.id) {
                currentGenres.append(genre.name)
            }
        }
        return currentGenres
    }
}
