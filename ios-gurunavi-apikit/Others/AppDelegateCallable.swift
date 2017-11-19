//
//  AppDelegateAccesible.swift
//  ios-gurunavi-apikit
//
//  Created by yogasawara@stv on 2017/11/20.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

protocol AppDelegateCallable {}

extension AppDelegateCallable{
    func appDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}
