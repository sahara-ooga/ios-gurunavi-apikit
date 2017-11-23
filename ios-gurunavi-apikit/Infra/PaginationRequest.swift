//
//  PaginationRequestType.swift
//  ios-gurunavi-apikit
//
//  Created by yogasawara@stv on 2017/11/21.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import APIKit

protocol PaginationRequest:APIKit.Request
    where Response: PaginationResponse{
    
    var page:Int {get}
    func requestWithPage(page:Int) -> Self
}
