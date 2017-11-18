//
//  JSONDataParser.swift
//  ios_apikit_codable_sample
//
//  Created by Yuu Ogasa on 2017/11/14.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import Foundation
import APIKit

class JSONDataParser: APIKit.DataParser {
    var contentType: String?{
        return "application/json"
    }
    
    /// 受け取ったData型の値をそのまま返す
    ///
    /// - Parameter data: レスポンス
    /// - Returns: 受け取ったData型の値
    /// - Throws: 
    func parse(data: Data) throws -> Any {
        return data
    }
    
}

extension APIKit.Request where Response:Decodable{
    var dataParser:APIKit.DataParser{
        return JSONDataParser()
    }
    
    func response(from object:Any,urlResponse:HTTPURLResponse) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: object as! Data)
    }
}
