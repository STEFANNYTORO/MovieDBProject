//
//  ViewsProtocol.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 3/18/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import UIKit

class ViewListTable: UITableView, ListView {
    
    var listDelegate: MovieListDelegate?
    private let identifier = String(describing: CustomMovieTableViewCell.self)
    let rowHeightValue = 222
    
    init() {
        super.init(frame: CGRect.zero, style: .plain)
        initializeTable()
        dataSource = self
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    //Change configure
    func initializeTable() {
        let nib = UINib(nibName: identifier, bundle: nil)
        register(nib, forCellReuseIdentifier: identifier)
        self.isAccessibilityElement = true
        self.accessibilityIdentifier = AccessibilityHelper.MovieTable.rawValue
    }
}

//MARK: Datasource
extension ViewListTable: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDelegate?.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CustomMovieTableViewCell else {
            fatalError("The dequeued cell is not an instance of MovieTableViewCell.")
        }
        listDelegate?.configure(cell: cell , index: indexPath.row)
        cell.accessibilityLabel = listDelegate?.setAccessibilityLabel(cell: cell, index: indexPath.row)
        cell.accessibilityIdentifier = "\(AccessibilityHelper.MovieCell.rawValue) \(indexPath.row)"
       
         return cell
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat(rowHeightValue)
//    }
}

//MARK: Delegate
extension ViewListTable:  UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listDelegate?.didSelectItemAt(index: indexPath.row)
    }
    
    
}
