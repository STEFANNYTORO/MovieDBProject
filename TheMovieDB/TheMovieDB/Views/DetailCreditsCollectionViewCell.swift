//
//  DetailCreditsCollectionViewCell.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 4/23/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class DetailCreditsCollectionViewCell: UICollectionViewCell {
    
    let borderWidth = 1
    
    //MARK: Properties
    @IBOutlet weak var actorImage: UIImageView!
    @IBOutlet weak var actorName: UILabel!
    @IBOutlet weak var actorCharacter: UILabel!
    @IBOutlet weak var actorGender: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundedImage()
    }
    
    func roundedImage() {
        actorImage.layer.borderWidth = CGFloat(borderWidth)
        actorImage.layer.masksToBounds = false
        actorImage.layer.borderColor = UIColor.black.cgColor
        actorImage.layer.cornerRadius = actorImage.frame.height/2
        actorImage.clipsToBounds = true
    }

}
