//
//  MovieDetailViewController.swift
//  tableViewApp
//
//  Created by Christelle Nieves on 6/11/21.
//

import UIKit

class MovieDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
    }
}

// MARK: UI Setup
extension MovieDetailViewController {
    
    func setupMainView() {
        title = "Movie Details"
        view.backgroundColor = .systemGray6
    }
}
