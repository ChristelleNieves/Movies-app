//
//  MainViewController+TVShows.swift
//  movies-app
//
//  Created by Christelle Nieves on 7/29/21.
//

import Foundation
import UIKit

extension MainViewController {
    class TVShowsView: UIView {
        let containerStackView = UIStackView()
        let topStackView = UIStackView()
        let bottomStackView = UIStackView()
        let topRatedButton = CustomButton()
        let popularButton = CustomButton()
        let airingTodayButton = CustomButton()
        let currentlyAiringButton = CustomButton()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
            setupContainerStackView()
            setupTopStackView()
            setupBottomStackView()
            setupButtons()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupView() {
            self.layer.cornerRadius = 18
            self.backgroundColor = AppColor.AppContrastBackground
        }
        
        private func setupTopStackView() {
            topStackView.axis = .horizontal
            topStackView.alignment = .fill
            topStackView.distribution = .fillEqually
            topStackView.spacing = 15
            containerStackView.addArrangedSubview(topStackView)
        }
        
        private func setupBottomStackView() {
            bottomStackView.axis = .horizontal
            bottomStackView.alignment = .fill
            bottomStackView.distribution = .fillEqually
            bottomStackView.spacing = 15
            containerStackView.addArrangedSubview(bottomStackView)
        }
        
        private func setupContainerStackView() {
            containerStackView.axis = .vertical
            containerStackView.alignment = .fill
            containerStackView.distribution = .fillEqually
            containerStackView.spacing = 15
            self.addSubview(containerStackView)
            
            // Constraints
            containerStackView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                containerStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
                containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                containerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25)
            ])
        }
        
        private func setupButtons() {
            topRatedButton.setTitle("Top Rated", for: .normal)
            topStackView.addArrangedSubview(topRatedButton)
            
            popularButton.setTitle("Popular", for: .normal)
            topStackView.addArrangedSubview(popularButton)
            
            airingTodayButton.setTitle("Airing Today", for: .normal)
            bottomStackView.addArrangedSubview(airingTodayButton)
            
            currentlyAiringButton.setTitle("Currently Airing", for: .normal)
            bottomStackView.addArrangedSubview(currentlyAiringButton)
        }
    }
}
