//
//  FetchServiceTests.swift
//  TheMovieDBTests
//
//  Created by Stefanny Toro Ramirez on 4/24/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import XCTest

@testable import TheMovieDB
class FetchServiceTests: XCTestCase {

    
    func testSuccessResponse() {
        let waitingForService = self.expectation(description: "The movie db / movies fetch")
        
        RequestFacade.topRated(movieHandler: { (ListMovie) in
            XCTAssertNotNil(ListMovie.page, "Page of ListMovie exists")
            XCTAssertNotNil(ListMovie.results, "LisMovie results exists")
            let movies = ListMovie.results
            XCTAssertFalse(movies.isEmpty, "Movies can't be empty")
            waitingForService.fulfill()
            
        }) { (requestError)  in
            XCTFail(" Error in request:\(requestError.message)")
            waitingForService.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFailureResponse() {
        let waitingForService = self.expectation(description: "The movie db / movies fetch")
        
        RequestFacade.urlTopRated = "https://api.themoviedb.org/3/movie/upcoming?page=1&language=en-US&api_key="
        
        RequestFacade.topRated(movieHandler: { (ListMovie) in
           waitingForService.fulfill()
            
        }) { (requestError) in
            
            XCTFail("Request error of type \(requestError.type) status code: \(requestError.statusCode) message: \(requestError.message)")
            print("###  status code: \(requestError.statusCode) message: \(requestError.message) \n     Context: \(requestError.context ?? DecodingError.Context.init(codingPath: [], debugDescription: "")) ###")
            waitingForService.fulfill()
        }
        waitForExpectations(timeout: 7, handler: nil)
    }

}
