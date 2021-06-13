//
//  API_Response.swift
//  tableViewApp
//
//  Created by Christelle Nieves on 6/9/21.
//

import Foundation

// MARK: Movie Request

struct Response: Codable {
    var page: Int
    var results: [MovieDetails]
}

struct MovieDetails: Codable {
    var title: String
    var poster_path: String
    var overview: String
    var release_date: String
    var vote_average: Float
    var genre_ids: [Int]
}

// MARK: Genre Request

struct Genre_Response: Codable {
    var genres: [Genre]
}

struct Genre: Codable {
    var id: Int
    var name: String
}

// MARK: TV Show Request

struct Show_Response: Codable {
    var page: Int
    var results: [ShowDetails]
}

struct ShowDetails: Codable {
    var poster_path: String
    var name: String
    var first_air_date: String
    var overview: String
    var genre_ids: [Int]
    var vote_average: Float
}
