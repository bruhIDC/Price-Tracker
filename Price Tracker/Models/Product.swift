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
    var itemURL: URL? //URL to item

    init(dictionary: [String: Any]) {
        
        //Product Name
        let buff = dictionary["title"] as! [String]
        productName = buff[0]
        
        //Current Price
        let sellingStats = (dictionary["sellingStatus"] as? [Any])?[0] as! [String: Any]
        let curr = (sellingStats["currentPrice"] as! [Any])[0] as! [String: Any]
        price = curr["__value__"] as? String
        
        //Item ID
        let buff1 = dictionary["itemId"] as! [String]
        self.id = buff1[0]
        
        //Item URL
        let buff2 = (dictionary["viewItemURL"] as! [Any])[0] as! String
        itemURL = URL(string: buff2)!
        
        //Gallery Pictures
        if let data = dictionary["galleryPlusPictureURL"] as? [String] {
            let buff2 = data[0]
            let res = buff2.replacingOccurrences(of: "http", with: "https")
            imgStringURL = URL(string: res)!
        } else if let data = dictionary["galleryURL"] as? [String]{
            let buff3 = data[0]
            let res = buff3.replacingOccurrences(of: "http", with: "https")
            imgStringURL = URL(string: res)!
        }
        
    }
    
    class func products(dictionaries: [Any]) -> [Product]{
        var products: [Product] = []
        let buff = dictionaries[0] as! [Any]
        for dictionary in buff {
            let dict = dictionary as! [String: Any]
            let product = Product(dictionary: dict)
            products.append(product)
        }
        return products
    }
}
