//
//  RestInfoDto.swift
//  ios_apikit_codable_sample
//
//  Created by Yuu Ogasa on 2017/11/14.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import Foundation

struct RestInfoDto:Codable{
    let totalHitCount:String
    let hitPerPage:String
    let pageOffset:String
    let rests:[RestDto]
    
    private enum CodingKeys:String,CodingKey{
        case totalHitCount = "total_hit_count"
        case hitPerPage = "hit_per_page"
        case pageOffset = "page_offset"
        case rests = "rest"
    }
}
