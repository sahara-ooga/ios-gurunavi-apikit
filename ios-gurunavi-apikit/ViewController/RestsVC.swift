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
        
        //load rest info
        appDelegate().apiManager.fetchRestInfo(at: appDelegate().restsViewDataProvider.selectedArea!,
                                               page: 1){[weak self] result in
                                                DispatchQueue.main.async {
                                                    switch result{
                                                    case .success(let response):
                                                        self?.appDelegate().restsViewDataProvider
                                                        .add(response.restInfoDto.rests)
                                                        
                                                        self?.restsTableView.reloadData()
                                                        
                                                    case .failure(let error):
                                                        print("error>>>>\(error)")
                                                    }
                                                }
                                                
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension RestsVC:AppDelegateCallable{}

extension RestsVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
}
