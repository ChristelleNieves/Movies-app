//
//  API_Details.swift
//  tableViewApp
//
//  Created by Christelle Nieves on 6/9/21.
//

import Foundation

let BASE_URL = "https://api.themoviedb.org/3" // Base url for requests
let MODE = "trending" // Type of request
let MEDIA_TYPE = "movie" // Type of media that is being requested. Can be "movie" or "tv"
let TIME_WINDOW = "day" // Time window for trending request. Can be "day" or "week"
let IMAGE_BASE_URL = "http://image.tmdb.org/t/p" // Base URL for image request
let IMAGE_SIZE = "original" // The size of the movie poster image
let GENRE_MODE = "movie" // Either "movie" or "tv"
let GENRE = "genre"

// Sample request for movies that are trending today: "base_url + /mode + /media_type + /time_window + ?api_key=api_key"
