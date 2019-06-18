//
//  MovieListDelegate.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 4/1/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import UIKit

protocol MovieListDelegate: class {
    func numberOfItems() -> Int
    func configure(cell: Cell, index: Int)
    func didSelectItemAt(index: Int)
    func setAccessibilityLabel(cell: Cell, index: Int) -> String 
}
