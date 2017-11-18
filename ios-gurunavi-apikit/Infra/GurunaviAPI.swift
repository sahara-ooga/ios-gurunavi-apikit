//
//  GurunaviAPI.swift
//  ios_apikit_codable_sample
//
//  Created by Yuu Ogasa on 2017/11/14.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import Foundation
import APIKit
import Keys

struct GurunaviAPI{
    static let keys = Ios_apikit_codable_sampleTestsKeys()

    struct RestsRequest:APIKit.Request {
        typealias Response = RestInfoDto

        var baseURL: URL{
            return URL(string:"https://api.gnavi.co.jp/RestSearchAPI/20150630")!
        }
        
        var method: HTTPMethod{
            return .get
        }
        
        var path: String{
            return ""
        }
        
        func response(from object: Any, urlResponse: HTTPURLResponse) throws -> RestInfoDto {
            return try JSONDecoder().decode(RestInfoDto.self, from: object as! Data)//TODO:Data, jsonの取扱い
        }
        
        let areacode:String
        let hitPerPage:Int
        let offsetPage:Int
        
        var parameters: Any?{
            return ["areacode_l":areacode,
                    "hit_per_page":hitPerPage,
                    "offset_page":offsetPage,
                    "keyid":keys.accessKey,
                    "format":"json"]
        }
    }
}
