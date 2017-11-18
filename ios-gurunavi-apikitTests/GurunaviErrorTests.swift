//
//  GurunaviErrorTests.swift
//  ios_gurunavi_apikitTests
//
//  Created by Yuu Ogasa on 2017/11/14.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import XCTest

@testable import ios_gurunavi_apikit

class GurunaviErrorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDecodeErrorJSON() {
        let json = FileOrganizer.open(json: "Error")
        let result = try! JSONDecoder().decode(GurunaviError.self, from: json)
        
        let expect = (code:GurunaviError.Code.invalidType.rawValue,
                      message:"パラメーターに指定された値は存在しません")

        XCTAssertEqual(result.error.code,expect.code)
        XCTAssertEqual(result.error.message, expect.message)
    }
    
}
