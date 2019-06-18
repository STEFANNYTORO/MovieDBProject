//
//  Facade.swift
//  Watch Extension
//
//  Created by Stefanny Toro Ramirez on 4/5/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

class Facade {
    static let upComingjsonData = upComingJson.data(using: .utf8)!
    
    static func randomMovie() -> Movie {
        let query = try! JSONDecoder().decode(ListMovie.self, from: upComingjsonData)
        let movies = query.results
        let randomNumber = Int.random(in: 0 ..< movies.count)
        return movies[randomNumber]
    }
}
