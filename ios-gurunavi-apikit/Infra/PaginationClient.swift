//
//  PaginationClient.swift
//  ios-gurunavi-apikit
//
//  Created by yogasawara@stv on 2017/11/21.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import APIKit
import Result

class PaginationClient<Request: PaginationRequest> {
    let baseRequest:Request
    let updateHandler:(Result<Request.Response, SessionTaskError>) ->Void
    
    init(baseRequest:Request,
         updateHandler:@escaping (Result<Request.Response, SessionTaskError>)  -> Void) {
        self.baseRequest = baseRequest
        self.updateHandler = updateHandler
    }
    
    var elements:[Request.Response.Element] = []
    private var hasNextPage:Bool = false    
    private var page:Int = 1
    
    func refresh() {
        let request = baseRequest.requestWithPage(page: 1)
        self.page = 1
        
        Session.send(request){ result in
            switch result {
            case .success(let response):
                self.elements = response.elements
                self.hasNextPage = response.hasNextPage
                self.updateHandler(Result(response))
            
            case .failure(let error):
                self.updateHandler(Result(error: error))
            }
        }
    }
    
    func loadNextPage() {
        guard hasNextPage else {
            return
        }
        
        self.page += 1
        let request = baseRequest.requestWithPage(page: self.page)
        
        Session.send(request){ result in
            switch result {
            case .success(let response):
                self.elements = response.elements
                self.hasNextPage = response.hasNextPage
                self.updateHandler(Result(response))
                
            case .failure(let error):
                self.updateHandler(Result(error: error))
            }
        }
        
    }
}
