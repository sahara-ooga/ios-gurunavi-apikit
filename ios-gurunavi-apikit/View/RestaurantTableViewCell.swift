//
//  RestaurantsTableViewCell.swift
//  Gurunavi
//
//  Created by yogasawara@stv on 2017/05/10.
//  Copyright © 2017年 smart tech ventures. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nearestStationLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var telNumLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    
    @IBOutlet weak var storeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        nameLabel.text = ""
        nearestStationLabel.text = ""
        addressLabel.text = ""
        telNumLabel.text = ""
        budgetLabel.text = ""
        storeImageView.image = nil
    }
    
    func setAppearance(as restaurant:RestDto) {
        
        //ラベルの設定
        nameLabel.text = restaurant.name
        nearestStationLabel.text = restaurant.access.nearestStation
        addressLabel.text = restaurant.address
        telNumLabel.text = restaurant.tel
        budgetLabel.text = "¥" + restaurant.budget.insertComma()!
        
        //画像のダウンロード・表示
        if let url = restaurant.imageURLs.shopImage1{
            storeImageView.af_setImage(withURL: url)
        }
    }
    
    
}

extension String{
    func insertComma()->String?{
        let int = Int(self)
        
        guard let intValue = int else{
            return nil
        }
        
        let num = NSNumber(value: intValue)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        
        return formatter.string(from: num)
        
    }
    
}
