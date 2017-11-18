//
//  GurunaviError.swift
//  ios_apikit_codable_sample
//
//  Created by Yuu Ogasa on 2017/11/14.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//
import Foundation

struct GurunaviError:Error,Codable {
    struct ErrorDescription:Codable {
        let code:Int
        let message:String
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let codeString = try container.decode(String.self, forKey: .code)
            self.code = Int(codeString)!
            
            self.message = try container.decode(String.self, forKey: .message)
        }
        
    }
    
    let error:ErrorDescription
        
    enum Code:Int {
        case tooManyAccess = 429
        case noShop = 600
        case invalidAccess = 601
        case invalidShopNumber = 602
        case invalidType = 603
        case internalServerError = 604
    }
}

//extension GurunaviAPI.RestsRequest{
//    func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {
//        guard 200..<300 ~= urlResponse.statusCode else {
//            let data = object as! Data
//            throw try! JSONDecoder().decode(GurunaviError.self, from: data)
//        }
//        
//        return object
//    }
//}

