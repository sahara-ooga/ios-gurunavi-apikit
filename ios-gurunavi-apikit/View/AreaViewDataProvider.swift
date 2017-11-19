//
//  AreaViewDataProvider.swift
//  ios-gurunavi-apikit
//
//  Created by yogasawara@stv on 2017/11/19.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

class AreaViewDataProvider:NSObject,UITableViewDataSource{
    var areaInfo:AreaInfo!  //assigned as transition occured
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return areaInfo.areas.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: String(describing:AreaCell.self)) as? AreaCell else {
                
                let nib = UINib(nibName: String(describing: AreaCell.self),
                                bundle: nil)
                
                guard let areaCell = nib.instantiate(withOwner: nil,
                                                     options: nil).first as? AreaCell else {
                                                        fatalError()
                }
                
                areaCell.setCell(areaName: areaInfo.areas[indexPath.row].areaName)
                return areaCell
        }
        
        cell.setCell(areaName: areaInfo.areas[indexPath.row].areaName)
        
        return cell
    }
}
