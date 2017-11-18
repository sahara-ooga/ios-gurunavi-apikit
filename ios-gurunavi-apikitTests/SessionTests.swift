//
//  SessionTests.swift
//  ios_gurunavi_apikitTests
//
//  Created by Yuu Ogasa on 2017/11/15.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import XCTest
import APIKit
@testable import ios_gurunavi_apikit

class SessionTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let expectation = XCTestExpectation(description: "Fetch restInfoDto")
        
        let request = GurunaviAPI.RestsRequest(areacode: "AREAL5522",
                                   hitPerPage: 3,
                                   offsetPage: 1)
        
        Session.send(request){result in
            switch result{
            case .success(let restInfoDto):
                print("success>>>",restInfoDto)
                XCTAssertEqual(restInfoDto.rests.count, 3)
                expectation.fulfill()
            case .failure(let error):
                print("error: \(error)")
                XCTFail("fail to search.")
            }
            
        }
     
        wait(for:[expectation],timeout:100.0)
    }
    
}
