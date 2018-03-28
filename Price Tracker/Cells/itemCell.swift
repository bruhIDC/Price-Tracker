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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
