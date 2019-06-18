//
//  CreditsStruct.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 4/23/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

struct MovieCredits: Codable {
    var id: Int = 0
    var cast: [Cast] = [Cast]()
}

struct Cast: Codable {
    var character: String = ""
    var gender: Int = 0 
    var name: String? = ""
    var profile_path: String? = ""
}

enum Gender: String {
    case Male
    case Female
}
