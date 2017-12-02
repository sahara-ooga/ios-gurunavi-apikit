//
//  GurunaviAPIManagerTests.swift
//  ios-gurunavi-apikitTests
//
//  Created by yogasawara@stv on 2017/11/19.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import XCTest
@testable import ios_gurunavi_apikit

class GurunaviAPIManagerTests: XCTestCase {
    let mngr = GurunaviAPIManager()
    
    let areas:[Area] = {
        let json = FileOrganizer.open(json: JSONFile.areaParsedPartial)
        
        let result = try! JSONDecoder().decode(AreaMaster.self,
                                               from: json)
        return result.areas
    }()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchRestsInfo() {
        let hitPerPage = 2
        let expectation = XCTestExpectation(description: "Fetch restInfoDto")
        
        // When to use: move from AreaVC to RestsVC
        mngr.fetchRestInfo(at:areas[0],hitPerPage: hitPerPage){result in
            print("testFetchRestsInfo received result...")

            switch result{
                
            case .success(let response):
                print("success>>>",response)
                XCTAssertEqual(response.restInfoDto.hitPerPage, hitPerPage)
                expectation.fulfill()
                
            case .failure(let error):
                print("error: \(error)")
                XCTFail("fail to search.")
            }
            
        }
        
        wait(for:[expectation],timeout:10.0)

    }
    
}
