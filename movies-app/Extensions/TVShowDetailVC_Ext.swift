//
//  TVShowDetailVC_Ext.swift
//  movies-app
//
//  Created by Christelle Nieves on 6/15/21.
//

import Foundation
import UIKit
import Combine

// API Helper Functions for TVShowDetailViewController
extension TVShowDetailViewController {
    
    // Fetch videos associated with a specific movie ID
    func fetchVideos() {
        let idString = String(show?.id ?? 0)
        let urlString = "\(BASE_URL)/tv/\(idString)/videos?api_key=\(API_KEY)"
        
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
    
    // Return the video ID of a YouTube trailer as a String
    func getVideoId() -> String {
        for video in videos {
            if video.site == "YouTube" && video.type == "Trailer" {
                return video.key
            }
        }
        return ""
    }
}
