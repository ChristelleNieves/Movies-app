//
//  ListModes.swift
//  movies-app
//
//  Created by Christelle Nieves on 6/12/21.
//

import Foundation

// A mode corresponds to the button the user chooses on the home screen.
// The specified mode will determine the data that will be fetched from the API and displayed to the screen.

enum MovieMode {
    case Trending
    case NowPlaying
    case Upcoming
    case TopRated
    case Popular
}

enum TVMode {
    case Trending
    case TopRated
    case Popular
    case AiringToday
    case CurrentlyAiring
}
