//
//  SimilarMoviesExtension.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 4/5/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

extension DetailViewController: UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return similarMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? SimilarCollectionViewCell else {
            fatalError("The dequeued cell is not an instance ")
        }
        
        let similarMovie = similarMovies[indexPath.item]
        let image = similarMovie.poster_path
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(image)")
        cell.posterImage.af_setImage(withURL: url!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 98, height: 138)
    }
    
    
}
