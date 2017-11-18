//
//  Area.swift
//  ios_apikit_codable_sample
//
//  Created by Yuu Ogasa on 2017/11/15.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

struct Area:Codable {
    let areaCode:String //areacode_l
    let areaName:String //areaname_l
    
    struct Pref:Codable {
        let prefCode:String
        let prefName:String
        
        private enum CodingKeys:String,CodingKey{
            case prefCode = "pref_code"
            case prefName = "pref_name"
        }
    }
    let pref:Pref
    
    private enum CodingKeys:String,CodingKey{
        case areaCode = "areacode_l"
        case areaName = "areaname_l"
        case pref
    }
}

struct AreaMaster:Codable {
    let areas:[Area]
    
    private enum CodingKeys:String,CodingKey{
        case areas = "garea_large"
    }
}
