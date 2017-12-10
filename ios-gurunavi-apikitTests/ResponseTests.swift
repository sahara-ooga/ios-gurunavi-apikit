//
//  ResponseTests.swift
//  ios-gurunavi-apikitTests
//
//  Created by yogasawara@stv on 2017/12/06.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import XCTest
@testable import ios_gurunavi_apikit

class ResponseTests: XCTestCase {
    
    let oneRestResponse:GurunaviPaginationResponse = {
        let json = FileOrganizer.open(json: "Onerest")
        let dto = try! JSONDecoder().decode(RestInfoDto.self, from: json)
        return GurunaviPaginationResponse(restInfoDto: dto, page: dto.pageOffset)
    }()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //add last page test using fake JSON.
    func testHasNextPageWhenNoNextPage() {
        XCTAssertEqual(oneRestResponse.hasNextPage, false)
    }
    
    
}
