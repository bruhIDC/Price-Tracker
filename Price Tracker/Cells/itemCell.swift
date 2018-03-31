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
    
    var product: Product!{
        didSet {
            productLbl.text = product.productName
            priceLbl.text = product.price
            if product.imgStringURL != nil{
               productImg.af_setImage(withURL: product.imgStringURL!)
            }
        }
        
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
