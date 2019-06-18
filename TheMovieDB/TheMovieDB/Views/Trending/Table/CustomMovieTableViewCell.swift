//
//  CustomMovieTableViewCell.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 3/12/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class CustomMovieTableViewCell: UITableViewCell, Cell {
    var overview: UILabel?
    var popularity: UILabel?
    var releaseDate: UILabel?
       
    //MAKE: Properties
    @IBOutlet weak var customImageMovie: UIImageView!
    @IBOutlet weak var customTitleMovie: UILabel?
    @IBOutlet weak var customImageStar: UIImageView!
    @IBOutlet weak var customVoteAverageMovie: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let star = UIImage(named: "highlightedStar") ?? nil
            customImageStar.image = star
        setAcessibility()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        customImageMovie.image = nil
    }
}

fileprivate extension CustomMovieTableViewCell {
    func setAcessibility() {
        customImageMovie.isAccessibilityElement = false
        customTitleMovie?.isAccessibilityElement = false
        customVoteAverageMovie?.isAccessibilityElement = false
        customImageStar.isAccessibilityElement = false
        self.isAccessibilityElement = true
    }
}
