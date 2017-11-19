//
//  AreaVC.swift
//  ios-gurunavi-apikit
//
//  Created by yogasawara@stv on 2017/11/18.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

class AreaVC: UIViewController {

    var areaInfo:AreaInfo! = nil
    @IBOutlet weak var areaTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        
        // Do any additional setup after loading the view.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AreaVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return areaInfo.areas.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = areaTableView
            .dequeueReusableCell(withIdentifier: String(describing:AreaCell.self)) as? AreaCell else {
                
            let nib = UINib(nibName: String(describing: AreaCell.self), bundle: nil)
            
            guard let areaCell = nib.instantiate(withOwner: nil, options: nil).first as? AreaCell else {
                fatalError()
            }
            areaCell.setCell(areaName: areaInfo.areas[indexPath.row].areaName)
            return areaCell
        }
        
        cell.setCell(areaName: areaInfo.areas[indexPath.row].areaName)
        
        return cell
    }
    
    func registerNibs() {
        self.areaTableView.register(UINib.init(nibName: String(describing: AreaCell.self),
                                           bundle: nil),
                                forCellReuseIdentifier: String(describing: AreaCell.self))
    }
    
    
}

extension AreaVC:UITableViewDelegate{
    
}
