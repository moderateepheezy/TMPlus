//
//  ApiService.swift
//  TMPlus
//
//  Created by SimpuMind on 11/19/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit

class ApiService: NSObject{
    
    
    static let sharedInstance = ApiService()
    
    let baseUrl = "http://voice.atp-sevas.com/demo/yql"
    
    func fetchEventsFeeds(completion: @escaping ([Event]) -> ()){
        
        fetchFeedForUrlString(urlString: "\(baseUrl)/events", completion: completion)
    }
    
    func fetchFeedForUrlString(urlString: String, completion: @escaping ([Event]) -> ()){
        
        let url = NSURL(string: urlString)!
        
        URLSession.shared.dataTask(with: url as URL) { (data, responseUrl, error) -> Void in
            if error != nil{
                print("Unable to fetch data\(error)")
                return
            }
                
            if let wrappedData = data,
                let json = try? JSONSerialization.jsonObject(with: wrappedData, options: .allowFragments) as? [String: Any]{
                        
                print("ThisisWrap\(json)")
                if let results = json?["data"] as? [[String: AnyObject]]{
                    let events = results.map({return Event(dictionary: $0)})
                            
                    DispatchQueue.main.async {
                        completion(events)
                    }
                }
                        
            }
            
        }.resume()
    }

}
