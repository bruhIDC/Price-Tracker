//
//  searchCell.swift
//  Price Tracker
//
//  Created by Farid Ramos on 3/30/18.
//  Copyright © 2018 bruhIDC. All rights reserved.
//

import UIKit

class searchCell: UITableViewCell {
    
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productLbl: UILabel!
    
    var product: Product! {
        didSet {
            if let data = product.imgStringURL {
                productImg.af_setImage(withURL:URL(string: data)!)
            }
            productLbl.text = product.productName
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
