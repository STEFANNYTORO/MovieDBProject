//
//  ListViewControllerTests.swift
//  TheMovieDBTests
//
//  Created by Stefanny Toro Ramirez on 4/2/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import XCTest

@testable import TheMovieDB
class ListViewControllerTests: XCTestCase {
    
    var tableView = ViewListTable()
    var listDelegate: MovieListDelegate?
    var cell: CustomMovieTableViewCell!
    let identifierCell = String(describing: CustomMovieTableViewCell.self)
    var mockMovie = Movie()
    
    var movieListDelegate = ListViewController()
    
    override func setUp() {
        mockMovie.titleMovie = "titleMovie"
        mockMovie.overview = "overviewMovie"
        movieListDelegate.movies = [mockMovie]
        tableView.listDelegate = movieListDelegate
    }

    override func tearDown() {
        listDelegate = nil
        super.tearDown()
    }
    
    func testListView() {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifierCell) as? CustomMovieTableViewCell
        tableView.listDelegate?.configure(cell: cell!, index: 0)
        let movieSize = tableView.listDelegate?.numberOfItems()
        let titleMovieCell = cell?.customTitleMovie?.text
        
        XCTAssertEqual(movieSize,movieListDelegate.movies.count, "movieSize must have array movies size")
        XCTAssertEqual(titleMovieCell, mockMovie.titleMovie, "label title of cell must contains the movie title")
    }
}

//class MockListViewController: MovieListDelegate {
//    var movies = [Movie]()
//    
//    func numberOfItems() -> Int {
//        return movies.count
//    }
//    
//    func configure(cell: Cell, index: Int) {
//        cell.customTitleMovie?.text = movies[0].titleMovie
//        cell.popularity?.text = ""
//    }
//    
//    func didSelectItemAt(index: Int) {
//        print("selected \(index)")
//    }
//    
//    func setAccessibilityLabel(cell: Cell, index: Int) -> String {
//        return "identifier"
//    }
//    
//    
//}
