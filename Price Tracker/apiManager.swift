//
//  apiManager.swift
//  Price Tracker
//
//  Created by Chris lin on 3/28/18.
//  Copyright © 2018 bruhIDC. All rights reserved.
//

import Foundation

class apiManager{
    static let baseUrl = "http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findItemsByKeywords&SERVICE-VERSION=1.0.0&SECURITY-APPNAME=Christop-PriceTra-PRD-f548627a6-b569484a&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&keywords="
    //static let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
    var session: URLSession
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func nowPlayingMovies(completion: @escaping ([Product]?, Error?) -> ()) {
        let url = URL(string: apiManager.baseUrl)!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                //ompletion(movies, nil)
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
