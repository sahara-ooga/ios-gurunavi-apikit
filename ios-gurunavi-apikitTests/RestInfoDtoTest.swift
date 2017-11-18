//
//  RestInfoDtoTest.swift
//  ios_gurunavi_apikitTests
//
//  Created by Yuu Ogasa on 2017/11/14.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import XCTest
@testable import ios_gurunavi_apikit

class RestInfoDtoTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDecode() {
        let json = FileOrganizer.open(json: "response")
        let result = try! JSONDecoder().decode(RestInfoDto.self, from: json)
        XCTAssertNotNil(result)
    }
    
    func testFileLoad() {
        let path : String = Bundle.main.path(forResource: "response", ofType: "json")!
        
        let fileHandle : FileHandle = FileHandle(forReadingAtPath: path)!
        let result = fileHandle.readDataToEndOfFile() as Data
        XCTAssertNotNil(result)
    }
    
}
