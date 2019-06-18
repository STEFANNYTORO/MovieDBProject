//
//  TvSeriesStruct.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 5/22/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

struct TvSerie: Codable {
    var id: Int = 0
    var name: String = ""
    var overview: String = ""
    var poster_path: String = ""
    var backdrop_path: String? = ""
    var first_air_date: String = ""
    var popularity: Float = 0
    var vote_average: Float = 0
    //spoken_languages

}

struct ListTvSeries: Codable {
    var page: Int = 0
    var results: [TvSerie] = [TvSerie()]
}
