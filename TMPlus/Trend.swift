//
//  Trend.swift
//  TMPlus
//
//  Created by SimpuMind on 11/19/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit

class Trend: NSObject {
    
    fileprivate var name: String?
    fileprivate var query: String?
    fileprivate var tweet_volume: Int?
    private var tweets_sata: [TweetsSatum]?
}


class TweetsSatum: NSObject {
    fileprivate var tweet: String?
    private var user: String?
}
