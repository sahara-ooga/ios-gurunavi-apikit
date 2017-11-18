//
//  DataParser.swift
//  ios_apikit_codable_sample
//
//  Created by Yuu Ogasa on 2017/11/14.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import Foundation

public protocol DataParser{
    var contentType:String? {get}
    func parse(data:Data) throws -> Any
}
