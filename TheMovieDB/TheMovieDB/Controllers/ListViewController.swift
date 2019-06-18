//
//  ListViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//  Created by Stefanny Toro.

import UIKit
import Foundation
import Alamofire

class ListViewController: UIViewController {
    
    var movies = [Movie]()
    var listView: ListView?
    let transition = PopAnimation()
    var selectedImage: UIImageView?
   
//    override func viewWillAppear(_ animated: Bool) {
//        (listView as? UIView)?.frame = self.view.bounds
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Trending"
        requestTrending()
        checkDevice()
        configurelistView()
        transition.dismissCompletion = {
            self.selectedImage!.isHidden = false
        }
    }
    
    func checkDevice() {
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            listView = ViewListCollection()
        }
        else {
            listView = ViewListTable()
        }
    }
    
    func requestTrending() {
        RequestFacade.trending(movieHandler: { (listMovie) in
            self.movies = listMovie.results
            self.listView?.reloadData()
        }) { (errorEnum) in
        }
    }
    
    func configurelistView() {
        (listView as? UIView)?.frame = self.view.bounds
        let contentView = listView as! UIView
        view.addSubview(contentView)
        contentView.addConstraints(toFillSuperView: view)
        
        
        listView?.listDelegate = self
        
    }
}

//MARK: MovieListDelegate
extension ListViewController: MovieListDelegate {
    
    func numberOfItems() -> Int {
        return movies.count
    }
    
    func configure(cell: Cell, index: Int) {
        let movie = movies[index]
        let image = movie.backdrop_path
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(image ?? "")")
        cell.customImageMovie.af_setImage(withURL: url!)
        selectedImage = cell.customImageMovie
        
        if (cell.customTitleMovie != nil && cell.customVoteAverageMovie != nil) {
            cell.customTitleMovie?.text = movie.titleMovie
            cell.customVoteAverageMovie?.text = String(movie.vote_average)
        }
    }
    
    func setAccessibilityLabel(cell: Cell, index: Int) -> String {
        let movie = movies[index]
        var cellLabel = "\(movie.titleMovie), "
        
        if (cell.customVoteAverageMovie != nil) {
            cellLabel.append("Score: \(String(describing: movie.vote_average))")
        }
        return cellLabel
    }
    
    func didSelectItemAt(index: Int) {
        let detailController = self.storyboard?.instantiateViewController(withIdentifier: String(describing: DetailViewController.self)) as! DetailViewController
//        let detailController = DetailCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        detailController.detailMovie = movies[index]
        detailController.transitioningDelegate = self
        present(detailController, animated: true)
    }
}

extension ListViewController: UIViewControllerTransitioningDelegate {
    
    // Asks your delegate for the transition animator object to use when presenting a view controller.
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = true
        selectedImage!.superview!.convert(selectedImage!.frame, to: nil)

        return transition
    }
    
    // Asks your delegate for the transition animator object to use when dismissing a view controller.
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = false
        return transition
    }
}

