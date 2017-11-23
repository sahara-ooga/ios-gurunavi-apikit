//
//  PaginationClientTests.swift
//  ios-gurunavi-apikitTests
//
//  Created by yogasawara@stv on 2017/11/23.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import XCTest
@testable import ios_gurunavi_apikit

class PaginationClientTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRefresh() {
        let expectation = XCTestExpectation(description: "Pagination client fetches restInfoDto")
        let hitPerPage = 3
        let request = GurunaviAPI.RestsRequest(areacode: "AREAL5522",
                                               hitPerPage: hitPerPage,
                                               offsetPage: 1)
        
        let pSession = PaginationClient(baseRequest: request){
            result in
            switch result{
            case .success(let response):
                XCTAssertEqual(response.restInfoDto.rests.count,
                               hitPerPage)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("fail to fetch response >>>>error:\(error)")
            }
            
        }
        
        pSession.refresh()
        wait(for:[expectation],timeout:10.0)
    }

}
