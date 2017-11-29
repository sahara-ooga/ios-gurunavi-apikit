//
//  AutomatonTests.swift
//  ios-gurunavi-apikitTests
//
//  Created by yogasawara@stv on 2017/11/25.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import XCTest
@testable import ios_gurunavi_apikit

class AutomatonTests: XCTestCase {
    let machine = AutomatonManager.apiAccessMachine
    var currentState: GApiState? = .root

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testErrorToFull() {
        self.tryRoute(events: [
            DefaultEvent.errorOccur,
            DefaultEvent.loadPartially,
            DefaultEvent.loadFully
            ])
        XCTAssert(self.currentState == .fullyLoaded)
    }
    
    func testPartialToFull() {
        self.tryRoute(events: [
            DefaultEvent.loadPartially,
            DefaultEvent.loadPartially,
            DefaultEvent.loadFully
            ])
        XCTAssert(self.currentState == .fullyLoaded)
    }
    
    func testPartialErrorAndFull() {
        self.tryRoute(events: [
            DefaultEvent.loadPartially,
            DefaultEvent.errorOccur,
            DefaultEvent.loadFully,
            DefaultEvent.errorOccur,
            DefaultEvent.loadPartially
            ])
        XCTAssert(self.currentState == .partiallyLoaded)
    }
    
    func testFullToError() {
        self.tryRoute(events: [
            DefaultEvent.loadFully,
            DefaultEvent.loadPartially,
            DefaultEvent.errorOccur
            ])
        XCTAssert(self.currentState == .loadedError)
    }
    
    private func tryRoute(events: [GApiEvent]) {
        for event in events {
            self.currentState.map { state in
                self.currentState = self.machine.transition(from: state,
                                                            by: event)
            }
        }
    }
}
