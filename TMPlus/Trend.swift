//
//  Trend.swift
//  TMPlus
//
//  Created by SimpuMind on 11/19/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit

class Trend: NSObject, JSONDecodable {
    
    var name: String
    var query: String
    var tweetVolume: Int
    var tweetsSata = [TweetsSatum]()

    
    required init(_ json: [String: Any]) {
        
        name = json["name"] as? String ?? ""
        query = json["query"] as? String ?? ""
        tweetVolume = json["tweet_volume"] as? Int ?? 0
        if let tweets = json["tweets_sata"] as? [[String:String]] {
            tweetsSata = tweets.map { TweetsSatum(json:$0) }
        }
    }
    
}


class TweetsSatum: NSObject {
    var tweet: String
    var user: String
    
    required init(json: [String: String]) {
        tweet = json["tweet"] ?? ""
        user = json["user"] ?? ""
    }
}
