//
//  PaginationResponse.swift
//  ios-gurunavi-apikit
//
//  Created by yogasawara@stv on 2017/11/21.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import Foundation

protocol PaginationResponse {
    associatedtype Element:Decodable
    
    var elements:[Element] { get }
    var hasNextPage: Bool { get }
}
