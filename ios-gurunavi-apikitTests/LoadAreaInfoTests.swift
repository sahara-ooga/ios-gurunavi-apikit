//
//  LoadAreaInfoTests.swift
//  ios_gurunavi_apikitTests
//
//  Created by Yuu Ogasa on 2017/11/15.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import XCTest
@testable import ios_gurunavi_apikit

class LoadAreaInfoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadAndParsePref() {
        let json = FileOrganizer.open(json: JSONFile.prefMaster)
        XCTAssertNotNil(json)
        
        let result = try! JSONDecoder().decode(PrefMaster.self, from: json)
        XCTAssertNotNil(result)
        
        XCTAssertEqual(result.prefs.count, 47)
    }
    
    func testLoadAndParseAreaPartial() {
        let json = FileOrganizer.open(json: JSONFile.areaParsedPartial)
        
        let result = try! JSONDecoder().decode(AreaMaster.self,
                                               from: json)
        XCTAssertEqual(result.areas.count,2)
        
    }
    
    func testLoadAndParseArea() {
        let json = FileOrganizer.open(json: JSONFile.areaParsed)
        
        let result = try! JSONDecoder().decode(AreaMaster.self,
                                               from: json)
        XCTAssertNotNil(result)
        
    }
}
