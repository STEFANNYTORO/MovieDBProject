//
//  RequestFacadeTests.swift
//  TheMovieDBTests
//
//  Created by Stefanny Toro Ramirez on 4/2/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import XCTest
import OHHTTPStubs

@testable import TheMovieDB

class RequestFacadeTests: XCTestCase {
    var testMovie = [Movie]()
    var error = ErrorEnum.errorConectionFaile.errorDescription
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        OHHTTPStubs.removeAllStubs()
    }
    
    func testFetchError(){
        var error2: String = ""
        RequestFacade.url = ""
        let expectation = self.expectation(description: "MakingRequest")
        
        RequestFacade.trending(movieHandler: { (listMovie) in
            XCTFail("Must return an error")
        }) { (errorEnum) in
            error2 = errorEnum.errorDescription ?? ""
            expectation.fulfill()
        }
        //waitForExpectations(timeout: 5, handler: nil)
        wait(for: [expectation], timeout: 3)
        XCTAssert(error2 == error)
    }
    
    func testFetchTrendingSucces(){
        RequestFacade.url = "https://api.themoviedb.org/3/trending/movie/day?api_key=1f4d7de5836b788bdfd897c3e0d0a24b"
        let mockPage = 1
        let mockResults = [ListMovie]()
        
        stub(condition: isHost("api.themoviedb.org")) { _ in
            let mockMovieResponse: [String : Any] = [
                "page" : mockPage,
                "results" : mockResults
            ]
            return OHHTTPStubsResponse(jsonObject: mockMovieResponse,
                                       statusCode: 200,
                                       headers: nil)
        }
        
        let waitingForService = expectation(description: "The movie db / movies call")
        RequestFacade.trending(movieHandler: { (listMovie) in
            XCTAssertEqual(mockPage,listMovie.page, "Fetch data movie")
            waitingForService.fulfill()
        }) { (errorEnum) in
            print(errorEnum)
            XCTFail()
            waitingForService.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchUpComingSucces() {
        let mockPage = 2
        let mockResults = [ListMovie]()
        
        stub(condition: isHost("api.themoviedb.org")) { _ in
            let mockMovieResponse: [String : Any] = [
                "page" : mockPage,
                "results" : mockResults
            ]
            return OHHTTPStubsResponse(jsonObject: mockMovieResponse,
                                       statusCode: 200,
                                       headers: nil)
        }
        
        let waitingForService = expectation(description: "The movie db / movies call")
        RequestFacade.upComing(movieHandler: { (listMovie) in
            XCTAssertEqual(mockPage,listMovie.page, "Fetch data movie")
            waitingForService.fulfill()
        }) { (errorEnum) in
            print(errorEnum)
            XCTFail()
            waitingForService.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
