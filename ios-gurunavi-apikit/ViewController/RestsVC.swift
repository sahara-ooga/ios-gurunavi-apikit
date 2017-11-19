//
//  RestsVC.swift
//  ios-gurunavi-apikit
//
//  Created by yogasawara@stv on 2017/11/19.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

class RestsVC: UIViewController {

    @IBOutlet weak var restsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        restsTableView.registarNib(RestaurantTableViewCell.self)
        restsTableView.dataSource = appDelegate().restsViewDataProvider
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension RestsVC:AppDelegateCallable{}

