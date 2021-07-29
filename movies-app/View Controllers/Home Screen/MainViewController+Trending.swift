//
//  MainViewController+Trending.swift
//  movies-app
//
//  Created by Christelle Nieves on 7/29/21.
//

import Foundation
import UIKit

extension MainViewController {
    class TrendingView: UIView {
        let stackView = UIStackView()
        let moviesButton = CustomButton()
        let showsButton = CustomButton()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
            setupStackView()
            setupMoviesButton()
            setupShowsButton()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupView() {
            self.layer.cornerRadius = 18
            self.backgroundColor = AppColor.AppContrastBackground
        }
        
        private func setupStackView() {
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.spacing = 15
            self.addSubview(stackView)
            
            // Constraints
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
                stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25)
            ])
        }
        
        private func setupMoviesButton() {
            moviesButton.setTitle("Movies", for: .normal)
            stackView.addArrangedSubview(moviesButton)
        }
        
        private func setupShowsButton() {
            showsButton.setTitle("TV Shows", for: .normal)
            stackView.addArrangedSubview(showsButton)
        }
    }
}
