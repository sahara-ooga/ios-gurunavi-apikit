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
        <#code#>
    }
}
