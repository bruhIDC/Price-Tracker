//
//  Item.swift
//  Price Tracker
//
//  Created by Chris lin on 4/2/18.
//  Copyright © 2018 bruhIDC. All rights reserved.
//

import Foundation

class Item {
    //This is where all the products variables and images will be stored
    var productName: String //Product Name
    var price: String? //Product Price
    //var id: String //Product ID
    var imgStringURL: String? //String URL of Image
    var itemURL: String? //URL to item
    
    init(name: String, price: String, imgURL: String, itemURL: String) {
        productName = name
        self.price = price
        //self.id = id
        imgStringURL = imgURL
        self.itemURL = itemURL
    }
}
