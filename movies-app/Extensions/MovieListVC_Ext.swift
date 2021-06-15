//
//  MovieListVC_Ext.swift
//  movies-app
//
//  Created by Christelle Nieves on 6/15/21.
//

import Foundation
import UIKit
import Combine

// API Helper functions for MovieListViewController
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
