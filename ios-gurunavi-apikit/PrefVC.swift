//
//  ViewController.swift
//  ios-gurunavi-apikit
//
//  Created by yogasawara@stv on 2017/11/16.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

class PrefVC: UIViewController {

    @IBOutlet weak var prefTableView: UITableView!
    
    let prefs:[Pref] = {
        let json = FileOrganizer.open(json: JSONFile.prefMaster)
        let prefMaster = try! JSONDecoder().decode(PrefMaster.self,
                                                   from: json)
        return prefMaster.prefs
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //navigation bar で戻ってきた時に、tableViewの選択を解除
        //https://qiita.com/AcaiBowl/items/8f71ca67da4c6f4b78d2
        if let indexPathForSelectedRow = prefTableView.indexPathForSelectedRow{
            prefTableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension PrefVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return prefs.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = prefTableView.dequeueReusableCell(withIdentifier: "PrefCell") else{
            let defaultCell = UITableViewCell(style: .default, reuseIdentifier: "PrefCell")
            defaultCell.textLabel?.text = prefs[indexPath.row].prefName
            return defaultCell
        }
        cell.textLabel?.text = prefs[indexPath.row].prefName
        
        return cell
    }
    
    
}

extension PrefVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //すべてのエリアの中から、選択した県のエリアを抽出する
        let areaInfo = loadAreaInfo(indexPath)
        moveToAreaVC(with: areaInfo)
    }
    
    func loadAreaInfo(_ indexPath:IndexPath)->AreaInfo{
        let pref = prefs[indexPath.row]
        
        let json = FileOrganizer.open(json: JSONFile.area)
        let areaMaster = try! JSONDecoder().decode(AreaMaster.self,
                                               from: json)
        let selectedAreas = areaMaster.areas.filter({$0.pref.prefCode == pref.prefCode})
        return AreaInfo(areas: selectedAreas)
    }
    
    func moveToAreaVC(with areaInfo:AreaInfo){
        let areaVC = AreaVC.init(nibName: String(describing: AreaVC.self), bundle: nil)
        areaVC.areaInfo = areaInfo
        self.navigationController?.pushViewController(areaVC, animated: true)
    }
}
