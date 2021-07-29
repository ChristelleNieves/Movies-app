//
//  MainViewController+Button.swift
//  movies-app
//
//  Created by Christelle Nieves on 7/29/21.
//

import Foundation
import UIKit

extension MainViewController {
    class CustomButton: UIButton {
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupButton()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupButton() {
            self.layer.cornerRadius = 15
            self.backgroundColor = AppColor.AppDarkBackground
            self.setTitleColor(AppColor.AppSubheadingText, for: .normal)
        }
    }
}
