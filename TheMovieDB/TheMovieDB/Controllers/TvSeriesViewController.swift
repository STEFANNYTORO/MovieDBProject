//
//  TvViewController.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 5/22/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class TvSeriesViewController: UIViewController {
    
    var series = [TvSerie]()
    var listView: ListView?
    let transition = PopAnimation()
    var selectedImage: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        requestTrending()
        checkDevice()
        configurelistView()

        // Do any additional setup after loading the view.
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
        RequestFacade.series(movieHandler: { (ListTvSeries) in
            self.series = ListTvSeries.results
            self.listView?.reloadData()
        }) { (RequestError) in
            print(RequestError)
        }

    }
    
    func configurelistView() {
        (listView as? UIView)?.frame = self.view.bounds
        let contentView = listView as! UIView
        view.addSubview(contentView)
        contentView.addConstraints(toFillSuperView: view)
        self.navigationItem.title = "Most popular"
        listView?.listDelegate = self
        
    }

}

//MARK: MovieListDelegate
extension TvSeriesViewController: MovieListDelegate {
    
    func numberOfItems() -> Int {
        print(series.count)
        return series.count
    }
    
    func configure(cell: Cell, index: Int) {
        let serie = series[index]
        let image = serie.backdrop_path
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(image ?? "")")
        cell.customImageMovie.af_setImage(withURL: url!)
        selectedImage = cell.customImageMovie
        
        if (cell.customTitleMovie != nil && cell.customVoteAverageMovie != nil) {
            cell.customTitleMovie?.text = serie.name
            cell.customVoteAverageMovie?.text = String(serie.vote_average)
        }
    }
    
    func setAccessibilityLabel(cell: Cell, index: Int) -> String {
        return ""
    }
    
    func didSelectItemAt(index: Int) {
        print("")
    }
}

extension TvSeriesViewController: UIViewControllerTransitioningDelegate {
    

}
