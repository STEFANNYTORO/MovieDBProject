//
//  ListTopRatedViewController.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 4/8/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import AlamofireImage

class UpComingViewController: UIViewController {

    var movies = [Movie]()
    var detailMovie: Movie?
    var listView: ListView?
    
    override func viewWillAppear(_ animated: Bool) {
        (listView as? UIView)?.frame = self.view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Now Playing"
        requestTopRated()
        checkDevice()
        configurelistView()
    }
  
    func checkDevice() {
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            // Collection view
        }
        else {
            listView = UpComingListView()
        }
    }
    
    func requestTopRated() {
        RequestFacade.upComing(movieHandler: { (listMovie) in
            self.movies = listMovie.results
            self.listView?.reloadData()
        }) { (errorEnum) in
            print(errorEnum.errorDescription as Any)
        }
    }
    
    func configurelistView() {
        view.addSubview(listView as! UIView)
        listView?.listDelegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "upComingSelectedSegue") {
            // Create a new variable to store the instance of PlayerTableViewController
            let detailVC = segue.destination as! DetailCollectionViewController
            detailVC.movieDetail = detailMovie
        }
    }
}

//MARK: MovieListDelegate
extension UpComingViewController: MovieListDelegate {
    
    func numberOfItems() -> Int {
        return movies.count
    }
    
    func configure(cell: Cell, index: Int) {
        let movie = movies[index]
        let image = movie.poster_path
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(image)")
        cell.customImageMovie.af_setImage(withURL: url!)
        if (cell.customVoteAverageMovie != nil) {
            cell.customTitleMovie?.text? = movie.titleMovie.uppercased()
            cell.customVoteAverageMovie?.text = String(movie.vote_average)
        }
        if (cell.popularity != nil && cell.releaseDate != nil) {
            //cell.overview?.text = movie.overview
            cell.popularity?.text = String(movie.popularity)
            cell.releaseDate?.text = movie.release_date
        }
    }
    
    func setAccessibilityLabel(cell: Cell, index: Int) -> String {
        let movie = movies[index]
        return movie.titleMovie
    }
    
    
    func didSelectItemAt(index: Int) {
        detailMovie = movies[index]
        performSegue(withIdentifier: "upComingSelectedSegue", sender: nil)
       
    }
  
    
}
