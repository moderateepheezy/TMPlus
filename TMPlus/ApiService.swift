//
//  ApiService.swift
//  TMPlus
//
//  Created by SimpuMind on 11/19/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit

protocol JSONDecodable {
    init?(_ json: [String: Any])
}

class ApiService: NSObject{
    
    
    static let sharedInstance = ApiService()
    
    let baseUrl = "http://voice.atp-sevas.com/demo/yql"
    
    func fetchNewsFeeds(completion: @escaping ([News]) -> ()){
        fetchFeedForUrlString(urlString: "\(baseUrl)/users/\(UserDefaults.standard.fetchUserDetails().id)/news/preferences?value=bella", completion: completion)
    }
    
    func fetchVideosFeeds(completion: @escaping ([Video]) -> ()){
        fetchFeedForUrlString(urlString: "\(baseUrl)/videos", completion: completion)
        
    }
    
    func fetchFeedForUrlString<T: JSONDecodable>(urlString: String, completion: @escaping     ([T]) -> ()){
        
        let url = NSURL(string: urlString)!
        
        URLSession.shared.dataTask(with: url as URL) { (data, responseUrl, error) -> Void in
            if error != nil{
                print("Unable to fetch data\(error)")
                return
            }
            
            if let wrappedData = data,
                let json = try? JSONSerialization.jsonObject(with: wrappedData, options: .allowFragments) as? [String: Any]{
                
                if let results = json?["data"] as? [[String: AnyObject]]{
                    let posts = results.flatMap({return T($0)})
                    
                    DispatchQueue.main.async {
                        completion(posts)
                    }
                }
                
            }
            
        }.resume()
    }
}
