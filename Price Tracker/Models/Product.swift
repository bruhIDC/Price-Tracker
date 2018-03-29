//
//  Product.swift
//  Price Tracker
//
//  Created by Farid Ramos on 3/28/18.
//  Copyright © 2018 bruhIDC. All rights reserved.
//

import Foundation

class Product {
    //This is where all the products variables and images will be stored
    var productName: String //Product Name
    var price: String? //Product Price
    var id: String //Product ID
    var imgStringURL: URL? //String URL of Image

    init(dictionary: [String: Any]) {
        productName = dictionary["title"] as! String
        let sellingStats = dictionary["sellingStatus"] as! [String: Any]
        let curr = sellingStats["currentPrice"] as! [String: Any]
        price = curr["__value__"] as? String
        self.id = dictionary["itemId"] as! String
        
        if let data = dictionary["galleryPlusPictureURL"] as? String {
            imgStringURL = URL(string: data)!
        } else {
            imgStringURL = URL(string: dictionary["galleryURL"] as! String)!
        }
        
    }
}
