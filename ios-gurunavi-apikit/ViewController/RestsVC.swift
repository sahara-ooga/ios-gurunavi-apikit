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
    var rests = [RestDto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registarNib(RestaurantTableViewCell.self, tableView: restsTableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension UIViewController{
    func registarNib<T:UITableViewCell>(_ subject:T.Type,tableView:UITableView){
        tableView.register(UINib.init(nibName: String(describing:T.self), bundle: nil),
                           forCellReuseIdentifier: String(describing:T.self))
    }
}

extension RestsVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return rests.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let restDto = self.rests[indexPath.row]
        
        guard let cell = restsTableView
            .dequeueReusableCell(withIdentifier: String(describing:RestaurantTableViewCell.self)) as? RestaurantTableViewCell else {
                
                let nib = UINib(nibName: String(describing: RestaurantTableViewCell.self), bundle: nil)
                
                guard let restCell = nib.instantiate(withOwner: nil, options: nil).first as? RestaurantTableViewCell else {
                    fatalError()
                }
                restCell.setAppearance(as: restDto)
                return restCell
        }
        
        cell.setAppearance(as: restDto)
        
        return cell
    }
    
    
}
