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
    
    static func fetchMoviesWithCombine() -> AnyPublisher<[MovieDetails], Never> {
        let urlString = "\(BASE_URL)/\(MODE)/\(MEDIA_TYPE)/\(TIME_WINDOW)?api_key=\(API_KEY)"
        
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
