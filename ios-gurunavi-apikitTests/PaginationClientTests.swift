//
//  PaginationClientTests.swift
//  ios-gurunavi-apikitTests
//
//  Created by yogasawara@stv on 2017/11/23.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import XCTest
import Result
@testable import ios_gurunavi_apikit

class PaginationClientTests: XCTestCase {
    
    var pNextSession:PaginationClient<GurunaviAPI.RestsRequest>!
    let group = DispatchGroup()
    let queue = DispatchQueue(label: "fetch api")
    
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
                XCTAssertEqual(response.hasNextPage, true)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("fail to fetch response >>>>error:\(error)")
            }
            
        }
        
        pSession.refresh()
        wait(for:[expectation],timeout:10.0)
    }

    func testLoadNextPage() {
        let expectation = XCTestExpectation(description: "Pagination client fetches first restInfoDto")
        let nextExpectation = XCTestExpectation(description:"next rest")
        
        let hitPerPage = 3
        
        let request = GurunaviAPI.RestsRequest(areacode: "AREAL5522",
                                                      hitPerPage: hitPerPage,
                                                      offsetPage: 1)
        var successed = 0
        
        group.enter()
        let pNextSession = PaginationClient(baseRequest: request){
            [weak self] result in
            switch result{
            case .success(let response):
                
                XCTAssertEqual(response.restInfoDto.rests.count,
                               hitPerPage)
                print("success!!!!!!!!!!")
                
                successed += 1
                
                if successed == 1{
                    XCTAssertEqual(response.page, 1)
                    expectation.fulfill()
                    self?.group.leave()
                }else if successed == 2{
                    XCTAssertEqual(response.page, 2)
                    nextExpectation.fulfill()
                }
                
            case .failure(let error):
                XCTFail("fail to fetch response >>>>error:\(error)")
            }
        }

        self.pNextSession = pNextSession
        pNextSession.refresh()

        group.notify(queue: .global()){
            self.completion()
        }
        
        wait(for:[expectation,nextExpectation],timeout:20.0)
    }
}

extension PaginationClientTests{
    func completion() {
        pNextSession.loadNextPage()
    }
}
