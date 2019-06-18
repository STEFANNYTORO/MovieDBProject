//
//  MovieList.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 3/15/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


protocol ListView {
    var listDelegate: MovieListDelegate? {get set}
    func reloadData()
}

protocol Cell {
    var customImageMovie: UIImageView! {get}
    var customTitleMovie: UILabel? {get}
    var customVoteAverageMovie: UILabel? {get}
    var overview: UILabel? {get}
    var popularity: UILabel? {get}
    var releaseDate: UILabel? {get}
}

