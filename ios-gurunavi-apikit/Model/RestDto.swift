//
//  RestDto.swift
//  ios_apikit_codable_sample
//
//  Created by Yuu Ogasa on 2017/11/14.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import Foundation

struct RestDto:Codable{
    let id : String
    let updateDate : String
    let name : String
    let nameKana:String
    let latitude : String
    let longitude : String
    let category : String
    let url:URL
    let urlMobile:URL
    
    struct ImageURLs:Codable{
        let shopImage1:URL?
        let shopImage2:URL?
        let qrCode:URL?
        
        private enum CodingKeys:String,CodingKey{
            case shopImage1 = "shop_image1"
            case shopImage2 = "shop_image2"
            case qrCode = "qrcode"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            shopImage1 = try? container.decode(URL.self, forKey: .shopImage1)
            shopImage2 = try? container.decode(URL.self, forKey: .shopImage2)    //{}が返って失敗する場合,nilが返る
            qrCode = try? container.decode(URL.self, forKey: .qrCode)
        }
    }
    let imageURLs:ImageURLs
    
    let address : String
    let tel : String
    
    struct Access:Codable {
        let line:String
        let station:String
        let stationExit:String?
        let walk:String?
        let note:String?
        
        private enum CodingKeys:String,CodingKey{
            case line
            case station
            case stationExit = "station_exit"
            case walk
            case note
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            line = try container.decode(String.self, forKey: .line)
            station = try container.decode(String.self, forKey: .station)    //{}が返って失敗する場合,nilが返る
            stationExit = try? container.decode(String.self, forKey: .stationExit)
            walk = try? container.decode(String.self, forKey: .walk)
            note = try? container.decode(String.self, forKey: .note)
        }
    }
    
    let access : Access
    
    let budget : String
    //let party : String
    //let lunch : String
    
    private enum CodingKeys:String,CodingKey{
        case id
        case updateDate = "update_date"
        case name
        case nameKana = "name_kana"
        case latitude
        case longitude
        case category
        case url
        case urlMobile = "url_mobile"
        case imageURLs = "image_url"
        case address
        case tel
        case access
        case budget
        //case party
        //case lunch
    }
}

//最寄り駅を取得
extension RestDto.Access{
    var nearestStation:String{
        var string = line + station
        
        if let exit = stationExit{
            string += exit
        }
        
        if let walk = walk{
            string += " 徒歩" + walk + "分"
        }
        
        return string
    }
}
