//
//  FileManager.swift
//  Gurunavi
//
//  Created by yuu ogasawara on 2017/05/12.
//  Copyright © 2017年 smart tech ventures. All rights reserved.
//

import Foundation

struct FileOrganizer {
    static func open(json fileName:String)->Data{
        let path : String = Bundle.main.path(forResource: fileName, ofType: "json")!
        
        let fileHandle : FileHandle = FileHandle(forReadingAtPath: path)!
        return fileHandle.readDataToEndOfFile() as Data
    }
}

extension String{
    func json() -> Data {
        let path : String = Bundle.main.path(forResource: self, ofType: "json")!
        let fileHandle : FileHandle = FileHandle(forReadingAtPath: path)!
        return fileHandle.readDataToEndOfFile() as Data
    }
}
