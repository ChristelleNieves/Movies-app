//
//  TVListVC_Ext.swift
//  movies-app
//
//  Created by Christelle Nieves on 6/15/21.
//

import Foundation
import UIKit
import Combine

// API Helper Functions for TVListViewController
extension TVListViewController {
    
    // Make a TV Show request to the API
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
