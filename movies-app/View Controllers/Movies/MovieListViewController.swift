//
//  ViewController.swift
//  tableViewApp
//
//  Created by Christelle Nieves on 6/9/21.
//

import UIKit
import Combine

// Displays a UITableView populated with MovieCells
class MovieListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var mode: MovieMode = MovieMode.NowPlaying
    var cachedImages = [IndexPath: UIImage]()
    var cancellables = Set<AnyCancellable>()
    var movies: [MovieDetails] = []
    var genres: [Genre] = []
    var tableView = UITableView()

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
        let urlString = "\(IMAGE_BASE_URL)/original/\(movies[indexPath.row].poster_path)"
        
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
        view.backgroundColor = AppColor.AppDarkBackground
        navigationController?.navigationBar.tintColor = AppColor.AppAccentHotPink
        navigationController?.navigationBar.barTintColor = AppColor.AppDarkBackground
        
        
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
    
    // Configure the table view
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        tableView.rowHeight = 300
        tableView.backgroundColor = AppColor.AppDarkBackground
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
