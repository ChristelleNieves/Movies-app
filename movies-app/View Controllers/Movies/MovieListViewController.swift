//
//  ViewController.swift
//  tableViewApp
//
//  Created by Christelle Nieves on 6/9/21.
//

import UIKit
import Combine

class MovieListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var mode: MovieMode = MovieMode.NowPlaying
    private var cachedImages = [IndexPath: UIImage]()
    private var cancellables = Set<AnyCancellable>()
    private var movies: [MovieDetails] = []
    private var genres: [Genre] = []
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupTableView()
        fetchGenres()
        fetchMovies()
    }
    
    // This function returns the number of cells within the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    // This function is responsible for populating an individual cell within the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let urlString = "\(IMAGE_BASE_URL)/\(IMAGE_SIZE)/\(movies[indexPath.row].poster_path)"
        
        // Retrieve the movie poster image for the corresponding movie
        fetchImage(at: urlString, for: indexPath, cell: cell)
        
        // Set the text field for the cell labels
        cell.titleLabel.text = movies[indexPath.row].title
        
        // If the current movie rating is zero, display a "not yet rated" message
        if movies[indexPath.row].vote_average == 0 {
            cell.voteAverageLabel.text = "Rating: Not yet rated"
        }
        else {
            cell.voteAverageLabel.text = "Rating: \(movies[indexPath.row].vote_average)/10"
        }
        
        cell.layoutMargins = UIEdgeInsets.zero
        
        return cell
    }
    
    // This function will run whenever a user selects a cell within the table view
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Get ready to open the detail VC
        let rootVC = MovieDetailViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        
        // Pass the chosen movie to the movie detail VC
        rootVC.movie = movies[indexPath.row]
        
        // Get the genres for the current movie
        rootVC.genres = getCurrentMovieGenres(movie: movies[indexPath.row]).joined(separator: ", ")
        
        tableView.deselectRow(at: indexPath, animated: true)
        present(navVC, animated: true, completion: nil)
    }
}


// MARK: UI Setup
extension MovieListViewController {
    
    func setupMainView() {
        // Set title according to mode
        switch mode {
        case .Trending:
            title = "Today's Trending Movies"
        case .NowPlaying:
            title = "Now Playing"
        case .Upcoming:
            title = "Upcoming Movies"
        case .TopRated:
            title = "Top Rated Movies"
        case .Popular:
            title = "Popular Movies"
        }
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
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
extension MovieListViewController {
    
    // Fetch all movies that are currently trending from the api
    func fetchMovies() {
        let urlString = API_Request.setMovieRequestUrl(mode: mode)
        
        // Make the request to the API
        API_Request.fetchMoviesFromAPI(urlString: urlString)
            .sink { results in
                self.movies = results
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            .store(in: &cancellables)
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
    
    // Fetch the image for the corresponding movie
    func fetchImage(at endpoint: String, for indexPath: IndexPath, cell: MovieCell) {
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
    
    // Returns an array holding all the genres that pertain to the current movie
    func getCurrentMovieGenres(movie: MovieDetails) -> [String] {
        var currentGenres: [String] = []
        
        for genre in genres {
            if movie.genre_ids.contains(genre.id) {
                currentGenres.append(genre.name)
            }
        }
        return currentGenres
    }
}

