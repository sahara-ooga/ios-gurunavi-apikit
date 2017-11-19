//
//  AreaVC.swift
//  ios-gurunavi-apikit
//
//  Created by yogasawara@stv on 2017/11/18.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

class AreaVC: UIViewController {

    @IBOutlet weak var areaTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //navigation bar で戻ってきた時に、tableViewの選択を解除
        //https://qiita.com/AcaiBowl/items/8f71ca67da4c6f4b78d2
        if let indexPathForSelectedRow = areaTableView.indexPathForSelectedRow{
            areaTableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareTableView() {
        areaTableView.registarNib(AreaCell.self)
        areaTableView.dataSource = appDelegate().areaViewDataProvider
    }

}



extension AreaVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        //すべてのエリアの中から、選択した県のエリアを抽出する
        let selectedArea = appDelegate().areaViewDataProvider.areaInfo.areas[indexPath.row]
        moveToRestsVC(at: selectedArea)
        
    }
    
    func moveToRestsVC(at area:Area){
        appDelegate().restsViewDataProvider.selectedArea = area
        
        //You must remove previous area data
        appDelegate().restsViewDataProvider.removeAllRests()
        
        let restsVC = RestsVC(nibName: String(describing: RestsVC.self), bundle: nil)
        self.navigationController?.pushViewController(restsVC, animated: true)
    }
}

extension AreaVC:AppDelegateCallable{}
