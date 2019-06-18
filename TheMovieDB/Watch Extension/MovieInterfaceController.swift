//
//  MovieInterfaceController.swift
//  Watch Extension
//
//  Created by Stefanny Toro Ramirez on 4/5/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit
import WatchKit

class MovieInterfaceController: WKInterfaceController {
    
    var recomendedMovie = Movie()

    //MARK: Properties
    @IBOutlet weak var movieImage: WKInterfaceImage!
    @IBOutlet weak var movieTitle: WKInterfaceLabel!
    @IBOutlet weak var movieVoteAverage: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        requestRandomMovie()
    }
    
    func requestRandomMovie() {
        RequestFacade.upComing(movieHandler: { (listMovie) in
            let movies = listMovie.results
            let randomNumber = Int.random(in: 0 ..< movies.count)
            self.recomendedMovie = movies[randomNumber]
            RequestFacade.requestImage(movie: self.recomendedMovie) { (data) in
                self.movieImage.setImageData(data)
            }
            self.movieTitle.setText(self.recomendedMovie.titleMovie)
            self.movieVoteAverage.setText(String(self.recomendedMovie.vote_average))
        }) { (ErrorEnum) in
            
        }
    }
}
