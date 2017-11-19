//
//  Pref.swift
//  ios_apikit_codable_sample
//
//  Created by Yuu Ogasa on 2017/11/15.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

struct Pref:Codable {
    let areaCode:String
    let prefCode:String
    let prefName:String
    
    private enum CodingKeys:String,CodingKey{
        case areaCode = "area_code"
        case prefCode = "pref_code"
        case prefName = "pref_name"
    }
}


struct PrefMaster:Codable {
    let prefs:[Pref]
    
    private enum CodingKeys:String,CodingKey{
        case prefs = "pref"
    }
}
