//
//  GApiEvent.swift
//  ios-gurunavi-apikit
//
//  Created by yogasawara@stv on 2017/11/25.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import Foundation

enum GApiEvent {
    case loadPartially(response:GurunaviPaginationResponse?)
    case loadFully(response:GurunaviPaginationResponse?)
    case errorOccur(error:Error?)
}

struct DefaultEvent {
    static let loadFully: GApiEvent = .loadFully(response: nil)
    static let loadPartially:GApiEvent = .loadPartially(response: nil)
    static let errorOccur:GApiEvent = .errorOccur(error: nil)
}

extension GApiEvent:Hashable {
    func toInt() -> Int {
        switch self {
        case .loadPartially : return 0
        case .loadFully: return 1
        case .errorOccur: return 2
        }
    }
    
    var hashValue: Int {
        return self.toInt()
    }
    
}

func == (lhs: GApiEvent, rhs: GApiEvent) -> Bool {
    return lhs.toInt() == rhs.toInt()
}
