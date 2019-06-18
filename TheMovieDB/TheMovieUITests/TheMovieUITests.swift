//
//  TheMovieUITests.swift
//  TheMovieUITests
//
//  Created by Stefanny Toro Ramirez on 4/11/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import XCTest

class TheMovieUITests: XCTestCase {
     var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testHeaders() {
        app.tabBars.buttons["Featured"].tap()
        let upComingLabel = app.navigationBars["Up Coming"]
        XCTAssertTrue(upComingLabel.exists, "Header must exists")
        
        app.tabBars.buttons["Recents"].tap()
        let TrendingLabel = app.navigationBars["Trending"]
        XCTAssertTrue(TrendingLabel.exists, "Header must exists")
    }
    
    func testDetailsMovieCell() {
        
        let movieTable = app/*@START_MENU_TOKEN@*/.tables["MovieTable"]/*[[".tables[\"Escape Room, Score: 6.3, Glass, Score: 6.6, How to Train Your Dragon: The Hidden World, Score: 7.6\"]",".tables[\"MovieTable\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let movieCell = app.tables["MovieTable"].cells["MovieCell 3"]
        
        while movieCell.exists == false {
            movieTable.swipeUp()
        }
        movieCell.tap()
        let titleDetail = app.staticTexts["TitleDetailMovie"]
        let overviewDetail = app.staticTexts["OverviewDetailMovie"]
        let dateDetail = app.staticTexts["DateDetailMovie"]
        
        XCTAssertTrue(titleDetail.exists, "Title detail must exists")
        XCTAssertTrue(overviewDetail.exists, "Overview detail must exists")
        XCTAssertTrue(dateDetail.exists, "Date detail must exists")
    }

}
