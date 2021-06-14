//
//  Theme.swift
//  movies-app
//
//  Created by Christelle Nieves on 6/12/21.
//

import Foundation
import UIKit

struct Colors {
    static let purple = UIColor.init(red: 84/240.0, green: 22/240.0, blue: 180/240.0, alpha: 0.87)
    static let heading = UIColor.init(white: 1, alpha: 0.87)
}

struct Fonts {
    static let heading = UIFont.monospacedDigitSystemFont(ofSize: 35, weight: .light)
}

struct Alphas {
    static let button = CGFloat(0.87)
}

struct Insets {
    static let button = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
}
