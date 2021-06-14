//
//  Theme.swift
//  movies-app
//
//  Created by Christelle Nieves on 6/12/21.
//

import Foundation
import UIKit

struct Colors {
    static var purple = UIColor.init(red: 84/240.0, green: 22/240.0, blue: 180/240.0, alpha: 0.87)
    static var heading = UIColor.init(white: 1, alpha: 0.87)
}

struct Fonts {
    static var heading = UIFont.monospacedDigitSystemFont(ofSize: 35, weight: .light)
}

struct Alphas {
    static var button = CGFloat(0.87)
}

struct Insets {
    static var button = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
}
