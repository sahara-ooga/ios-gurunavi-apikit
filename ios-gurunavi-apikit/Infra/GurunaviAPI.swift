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
        
        typealias Response = GurunaviPaginationResponse

        var baseURL: URL{
            return URL(string:"https://api.gnavi.co.jp")!
        }
        
        var method: HTTPMethod{
            return .get
        }
        
        var path: String{
            return "/RestSearchAPI/20150630"
        }
        
        func response(from object: Any, urlResponse: HTTPURLResponse) throws -> GurunaviPaginationResponse {
            let restInfoDto =  try JSONDecoder().decode(RestInfoDto.self, from: object as! Data)
            return GurunaviPaginationResponse(restInfoDto: restInfoDto, page: page)
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

extension GurunaviAPI.RestsRequest:PaginationRequest{
    var page: Int {
        return offsetPage
    }
    
    func requestWithPage(page: Int) -> GurunaviAPI.RestsRequest {
        return self
    }
    
    
}
