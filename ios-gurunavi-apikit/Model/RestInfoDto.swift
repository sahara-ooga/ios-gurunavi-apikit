//
//  RestInfoDto.swift
//  ios_apikit_codable_sample
//
//  Created by Yuu Ogasa on 2017/11/14.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import Foundation

struct RestInfoDto:Codable{
    let totalHitCount:Int
    let hitPerPage:Int
    let pageOffset:Int
    let rests:[RestDto]
    
    private enum CodingKeys:String,CodingKey{
        case totalHitCount = "total_hit_count"
        case hitPerPage = "hit_per_page"
        case pageOffset = "page_offset"
        case rests = "rest"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let totalHitCountString = try container.decode(String.self, forKey: .totalHitCount)
        totalHitCount = Int(totalHitCountString)!
        
        let hitPerPageString = try container.decode(String.self, forKey: .hitPerPage)
        hitPerPage = Int(hitPerPageString)!
        
        let pageOffSetString = try container.decode(String.self, forKey: .pageOffset)
        pageOffset = Int(pageOffSetString)!
        
        rests = try container.decode([RestDto].self, forKey: .rests)
    }
}
