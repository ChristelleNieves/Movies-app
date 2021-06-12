//
//  API.swift
//  tableViewApp
//
//  Created by Christelle Nieves on 6/9/21.
//

import Foundation
import UIKit
import Combine

struct API_Request {
    
    static func setUrl(mode: MovieMode) -> String {
        switch mode {
        case .Trending:
            return "\(BASE_URL)/\(MODE)/\(MEDIA_TYPE)/\(TIME_WINDOW)?api_key=\(API_KEY)"
        case .NowPlaying:
            return "\(BASE_URL)/\(MEDIA_TYPE)/now_playing?api_key=\(API_KEY)"
        case .Upcoming:
            return "\(BASE_URL)/\(MEDIA_TYPE)/upcoming?api_key=\(API_KEY)"
        case .TopRated:
            return "\(BASE_URL)/\(MEDIA_TYPE)/top_rated?api_key=\(API_KEY)"
        case .Popular:
            return "\(BASE_URL)/\(MEDIA_TYPE)/popular?api_key=\(API_KEY)"
        }
    }
    
    static func fetchMoviesFromAPI(urlString: String) -> AnyPublisher<[MovieDetails], Never> {
        guard let url = URL(string: urlString) else {
            return Just([]).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Response.self, decoder: JSONDecoder())
            .map(\.results)
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func fetchGenresWithCombine() -> AnyPublisher<[Genre], Never> {
        let urlString = "\(BASE_URL)/\(GENRE)/\(GENRE_MODE)/list?api_key=\(API_KEY)"
        
        guard let url = URL(string: urlString) else {
            return Just([]).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Genre_Response.self, decoder: JSONDecoder())
            .map(\.genres)
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
