//
//  ViewController.swift
//  tableViewApp
//
//  Created by Christelle Nieves on 6/9/21.
//

import UIKit
import Combine

class MovieListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var cachedImages = [IndexPath: UIImage]()
    var cancellables = Set<AnyCancellable>()
    var movies: [MovieDetails] = []
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainView()
        setupNavController()
        setupTableView()
        fetchMovies()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let urlString = "\(IMAGE_BASE_URL)/\(IMAGE_SIZE)/\(movies[indexPath.row].poster_path)"
        
        // Retrieve the movie poster image for the corresponding movie
        fetchImage(at: urlString, for: indexPath, cell: cell)
        
        cell.titleLabel.text = movies[indexPath.row].title
        cell.releaseDateLabel.text = "Released: \(movies[indexPath.row].release_date)"
        
        // If the current movie rating is zero, display a "not yet rated" message
        if movies[indexPath.row].vote_average == 0 {
            cell.voteAverageLabel.text = "Rating: Not yet rated"
        }
        else {
            cell.voteAverageLabel.text = "Rating: \(movies[indexPath.row].vote_average)/10"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rootVC = MovieDetailViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        tableView.deselectRow(at: indexPath, animated: true)
        
        present(navVC, animated: true, completion: nil)
    }
}


// MARK: UI Setup
extension MovieListViewController {
    
    func setupMainView() {
        title = "Trending Movies"
    }
    
    func setupNavController() {
        navigationController?.navigationBar.barTintColor = .black
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        tableView.rowHeight = 250
        tableView.backgroundColor = .systemGray6
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
    
    func fetchMovies() {
        API_Request.fetchMoviesWithCombine()
            .sink { results in
                self.movies = results
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            .store(in: &cancellables)
    }
    
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
}

