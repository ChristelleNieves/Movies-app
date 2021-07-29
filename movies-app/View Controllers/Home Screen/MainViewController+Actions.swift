//
//  MainViewController+Actions.swift
//  movies-app
//
//  Created by Christelle Nieves on 7/29/21.
//

import Foundation
import UIKit

extension MainViewController {
    func gotoTVShowList(mode: TVMode) {
        let listVC = TVListViewController()
        listVC.mode = mode
        navigationController?.pushViewController(listVC, animated: true)
    }
    
    func gotoMovieList(mode: MovieMode) {
        let listVC = MovieListViewController()
        listVC.mode = mode
        navigationController?.pushViewController(listVC, animated: true)
    }
}
