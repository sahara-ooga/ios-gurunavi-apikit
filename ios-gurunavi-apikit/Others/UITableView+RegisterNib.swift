//
//  UITableView+RegisterNib.swift
//  ios-gurunavi-apikit
//
//  Created by yogasawara@stv on 2017/11/20.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

extension UITableView{
    func registarNib<T:UITableViewCell>(_ subject:T.Type){
        self.register(UINib.init(nibName: String(describing:T.self), bundle: nil),
                      forCellReuseIdentifier: String(describing:T.self))
    }
}
