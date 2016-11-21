//
//  Trend.swift
//  TMPlus
//
//  Created by SimpuMind on 11/19/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit

class Trend: NSObject, JSONDecodable {
    
    fileprivate var _name: String?
    fileprivate var _query: String?
    fileprivate var _tweet_volume: Int?
    private var _tweets_sata: [TweetsSatum]?
    
    required init(_ json: [String: Any]) {
        super.init()
        
        _name = json["name"] as? String
        _query = json["query"] as? String
        _tweet_volume = json["tweet_volume"] as? Int
        //_tweets_sata = json["tweets_sata"] as? Int
        
    }
}


class TweetsSatum: NSObject {
    fileprivate var tweet: String?
    private var user: String?
}
