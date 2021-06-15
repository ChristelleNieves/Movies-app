//
//  MovieDetailVC_Ext.swift
//  movies-app
//
//  Created by Christelle Nieves on 6/15/21.
//

import Foundation
import UIKit
import Combine

// API Helper functions for a MovieDetailViewController
extension MovieDetailViewController {
    
    // Fetch videos from the API using a movie id
    func fetchVideos() {
        let movieIdString = String(movie?.id ?? 0)
        let urlString = "\(BASE_URL)/movie/\(movieIdString)/videos?api_key=\(API_KEY)"
        
        // Make the request to the API
        API_Request.fetchTrailerVideos(urlString: urlString)
            .sink { results in
                self.videos = results
                
                DispatchQueue.main.async {
                    self.youTubePlayer.load(videoId: self.getVideoId())
                }
            }
            .store(in: &cancellables)
    }
    
    // Return the video ID of a YouTube trailer as a string
    func getVideoId() -> String {
        for video in videos {
            if video.site == "YouTube" && video.type == "Trailer" {
                return video.key
            }
        }
        return ""
    }
}
