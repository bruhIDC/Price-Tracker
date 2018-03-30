//
//  APIManager.swift
//  Price Tracker
//
//  Created by Chris lin on 3/28/18.
//  Copyright © 2018 bruhIDC. All rights reserved.
//

import Foundation

class APIManager{
    let baseUrl = "http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findItemsByKeywords&SERVICE-VERSION=1.0.0&SECURITY-APPNAME=Christop-PriceTra-PRD-f548627a6-b569484a&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&paginationInput.entriesPerPage=10&keywords="
    var session: URLSession
    static var shared: APIManager = APIManager()
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func getItems(searchText: String, completion: @escaping ([Product]?, Error?) -> ()) {
        let url = URL(string: (baseUrl + searchText))!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let task = session.dataTask(with: request) {(data, response, error) in
            if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let dictionary = dataDictionary["findItemsByKeywordsResponse"]
            }
            
        }
    }
}
