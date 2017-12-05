//
//  GurunaviPaginationResponse.swift
//  ios-gurunavi-apikit
//
//  Created by yogasawara@stv on 2017/11/23.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

struct GurunaviPaginationResponse:PaginationResponse,Codable {
    typealias Element = RestDto
    let restInfoDto:RestInfoDto
    let page:Int
    
    var elements: [GurunaviPaginationResponse.Element]{
        return restInfoDto.rests
    }
    
    var hasNextPage: Bool{
        //how many rests loaded in total.
        let countOfLoadedElements = (page - 1) * restInfoDto.hitPerPage + elements.count
        return countOfLoadedElements < restInfoDto.totalHitCount
    }
}
