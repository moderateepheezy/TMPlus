//
//  Video.swift
//  TMPlus
//
//  Created by SimpuMind on 11/19/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit

class Video: NSObject, JSONDecodable {
    
    fileprivate var _id: String!
    fileprivate var _url: String!
    fileprivate var _title: String!
    fileprivate var _description: String!
    fileprivate var _published_at: String!
    
    fileprivate var _like_count: Int!
    fileprivate var _like_status: Int!
    
    
    var id: String?{
        if _id == nil{
            _id = ""
        }
        return _id
    }
    
    var url: String?{
        if _url == nil{
            _url = ""
        }
        return _url
    }
    
    var title: String?{
        if _title == nil{
            _title = ""
        }
        return _title
    }
    
    var __description: String?{
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var published_at: String?{
        if _published_at == nil{
            _published_at = ""
        }
        return _published_at
    }
    
    var like_count: Int?{
        if _like_count == nil{
            _like_count = 0
        }
        return _like_count
    }
    
    var like_status: Int?{
        if _like_status == nil{
            _like_status = 0
        }
        return _like_status
    }
    
    init(notLogIndict: [String: AnyObject]) {
        super.init()
        
    }
    
    init(dictionary: [String: AnyObject]) {
        super.init()
        
        _id = dictionary["id"] as? String
        _title = dictionary["title"] as? String
        _description = dictionary["description"] as? String
        _published_at = dictionary["published_at"] as? String
        _like_count = dictionary["like_count"] as? Int
        _like_status = dictionary["like_status"] as? Int
        
    }
    
    required init(_ json: [String: Any]) {
        super.init()
        
        _id = json["id"] as? String
        _title = json["title"] as? String
        _description = json["description"] as? String
        _published_at = json["published_at"] as? String
        _like_count = json["like_count"] as? Int
        _like_status = json["like_status"] as? Int

    }
    
    
}
