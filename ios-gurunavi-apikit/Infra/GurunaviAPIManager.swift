//
//  GurunaviAPIManager.swift
//  ios-gurunavi-apikit
//
//  Created by yogasawara@stv on 2017/11/19.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//
import APIKit
import Result

struct GurunaviAPIManager {
    func fetchRestInfo(at area:Area,
                       hitPerPage:Int = 50,
                       page: Int = 1,
                       completion:@escaping (_ result:Result<GurunaviAPI.RestsRequest.Response, SessionTaskError>) ->Void
        ) {
        let request = GurunaviAPI.RestsRequest(areacode: area.areaCode,
                                               hitPerPage: hitPerPage,
                                               offsetPage: page)
        
        Session.send(request){completion($0)}
            
    }
}

