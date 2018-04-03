//
//  itemCell.swift
//  Price Tracker
//
//  Created by Farid Ramos on 3/28/18.
//  Copyright © 2018 bruhIDC. All rights reserved.
//

import UIKit

class itemCell: UITableViewCell {

    
    @IBOutlet weak var productLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var productImg: UIImageView!
    
    var item: Item!{
        didSet {
            productLbl.text = item.productName
            print(item.productName)
            priceLbl.text = item.price
            if item.imgStringURL != nil{
                productImg.af_setImage(withURL: URL(string: item.imgStringURL!)!)
            }
        }
        
    }
    
    @IBAction func sendToSite(_ sender: Any) {
        UIApplication.shared.open(URL(string: item.itemURL!)!, options: [:])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
