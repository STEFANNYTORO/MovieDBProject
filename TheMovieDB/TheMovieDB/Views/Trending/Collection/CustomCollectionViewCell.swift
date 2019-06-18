//
//  CustomCollectionViewCell.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 3/13/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell, Cell {
    var overview: UILabel?
    var popularity: UILabel?
    var releaseDate: UILabel?
    var customTitleMovie: UILabel?
    var customVoteAverageMovie: UILabel?
    
    @IBOutlet weak var customImageMovie: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        customImageMovie.image = nil
    }
}
