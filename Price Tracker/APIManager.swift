//
//  APIManager.swift
//  Price Tracker
//
//  Created by Chris lin on 3/28/18.
//  Copyright © 2018 bruhIDC. All rights reserved.
//

import Foundation

class APIManager{
    let baseUrl = "https://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findItemsByKeywords&SERVICE-VERSION=1.0.0&SECURITY-APPNAME=Christop-PriceTra-PRD-f548627a6-b569484a&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&paginationInput.entriesPerPage=10&keywords="
    var session: URLSession
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func getItems(searchQuery: String, completion: @escaping ([Product]?, Error?) -> ()) {
        let url = URL(string: (baseUrl + searchQuery))!
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) {(data, response, error) in
            if let data = data {
                
                
                let dataDictionary = try! JSONSerialization.jsonObject(with: data) as! [String: Any]
                
                let dummy: [Product] = []
                
                let buff = dataDictionary["findItemsByKeywordsResponse"] as! [Any]
                let buff1 = buff[0] as! [String: Any]
                let buff2 = buff1["searchResult"] as! [Any]
                let buff3 = buff2[0] as! [String: Any]
                let buff4 = buff3["item"] as? [Any]
                
                if buff4 != nil {
                    let products = Product.products(dictionaries: [buff4!])
                    
                    completion(products, error)
                } else {
                    
                    completion(dummy, error)
                }
                
                
                
                
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
