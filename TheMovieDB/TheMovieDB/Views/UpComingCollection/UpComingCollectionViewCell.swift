//
//  TopRatedListCollectionViewCell.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 4/9/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class UpComingCollectionViewCell: UICollectionViewCell, Cell {
    
    @IBOutlet weak var customVoteAverageMovie: UILabel?
    @IBOutlet weak var customTitleMovie: UILabel?
    @IBOutlet weak var customImageMovie: UIImageView!
    @IBOutlet weak var overview: UILabel?
    @IBOutlet weak var popularity: UILabel?
    @IBOutlet weak var releaseDate: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
