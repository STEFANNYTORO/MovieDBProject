//
//  ListTopRatedTableView.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 4/8/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class UpComingListView: UICollectionView, ListView {
    var listDelegate: MovieListDelegate?
    let identifier = String(describing: UpComingCollectionViewCell.self)
    let itemsPerRow = CGFloat(2)
    let itemSize = CGSize(width: 170, height: 260)
    
    init() {
        super.init(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        configureCollection()
        backgroundColor = .white
        dataSource = self
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCollection() {
        let nib = UINib(nibName: identifier, bundle: nil)
        register(nib, forCellWithReuseIdentifier: identifier)
    }
}

//MARK: Datasource
extension UpComingListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listDelegate?.numberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier , for: indexPath) as? UpComingCollectionViewCell else {
            fatalError("The dequeued cell is not an instance ")
        }
        cell.backgroundColor = UIColor.white
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 3, height: 3)
        cell.layer.shadowOpacity = 0.7
        cell.layer.shadowRadius = 4.0
        cell.layer.cornerRadius = 6.0
        cell.layer.masksToBounds = false
        listDelegate?.configure(cell: cell, index: indexPath.row)
        
        return cell
    }
}

//MARK: DelegateFlowLayout
extension UpComingListView:  UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let width = collectionView.bounds.width
        let left = ((width - (itemSize.width * itemsPerRow)) / (itemsPerRow + 1))
        let right = ((width - (itemSize.width * itemsPerRow)) / (itemsPerRow + 1))
        return UIEdgeInsets(top: 0, left: left, bottom: 0, right: right)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        listDelegate?.didSelectItemAt(index: indexPath.item )
    }
}


