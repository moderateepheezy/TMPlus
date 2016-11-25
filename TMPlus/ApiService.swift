//
//  ApiService.swift
//  TMPlus
//
//  Created by SimpuMind on 11/19/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit
import Haneke

protocol JSONDecodable {
    init?(_ json: [String: Any])
}

class ApiService: NSObject{
    
    
    static let sharedInstance = ApiService()
    
    let baseUrl = "http://voice.atp-sevas.com/demo/yql"
    
    func fetchNewsFeeds(completion: @escaping ([News]) -> ()){
        
        guard let id = UserDefaults.standard.fetchUserDetails().id else{
            return
        }
        
        fetchFeedForUrlString(urlName: "News", urlString: "\(baseUrl)/users/\(id)/news/preferences?value=bella", completion: completion)
    }
    
    func fetchEventsFeeds(completion: @escaping ([Event]) -> ()){
    
        guard let id = UserDefaults.standard.fetchUserDetails().id else{
            return
        }
        fetchFeedForUrlString(urlName: "Event", urlString: "\(baseUrl)/events/\(id)", completion: completion)
        
    }
    
    func fetchTrendsFeeds(completion: @escaping ([Trend]) -> ()){
        fetchFeedForUrlString(urlName: "Trend", urlString: "\(baseUrl)/twitter/trends", completion: completion)
    }

    func fetchVideosFeeds(completion: @escaping ([Video]) -> ()){
        guard let id = UserDefaults.standard.fetchUserDetails().id else{
            return
        }
        fetchFeedForUrlString(urlName: "Video", urlString: "\(baseUrl)/videos/\(id)", completion: completion)
        
    }
    
//    func fetchFeedForUrlString<T: JSONDecodable>(urlString: String, completion: @escaping     ([T]) -> ()){
//        
//        let url = NSURL(string: urlString)!
//        
//        URLSession.shared.dataTask(with: url as URL) { (data, responseUrl, error) -> Void in
//            if error != nil{
//                print("Unable to fetch data\(error)")
//                return
//            }
//            
//            if let wrappedData = data,
//                let json = try? JSONSerialization.jsonObject(with: wrappedData, options: .allowFragments) as? [String: Any]{
//                //print("urlFormat\(url)\nJsonDataFormat\(json)")
//                if let results = json?["data"] as? [[String: AnyObject]]{
//                    let posts = results.flatMap({return T($0)})
//                    
//                    DispatchQueue.main.async {
//                        completion(posts)
//                    }
//                }
//                
//            }
//            
//        }.resume()
//    }
    
    func fetchFeedForUrlString<T: JSONDecodable>(urlName: String, urlString: String, completion: @escaping ([T]) -> ()){
        
        let cache = Cache<JSON>(name: urlName)
        let URL = NSURL(string: urlString)!
        
        cache.fetch(URL: URL as URL).onSuccess { json in
            if let results = json.dictionary["data"] as? [[String: AnyObject]]{
                let posts = results.flatMap({return T($0)})
                
                DispatchQueue.main.async {
                    completion(posts)
                }
            }
        }
    }

}
