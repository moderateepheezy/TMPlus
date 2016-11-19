//
//  Events.swift
//  TMPlus
//
//  Created by SimpuMind on 11/19/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit

class Event: NSObject {
    
    fileprivate var _id: String!
    fileprivate var _name: String!
    fileprivate var _description: String!
    fileprivate var _start: String!
    fileprivate var _img_name: String!
    fileprivate var _type: String!
    fileprivate var _url: String!
    fileprivate var _like_count: Int!
    fileprivate var _like_status: Int!
    
    var id: String?{
        if _id == nil{
            _id = ""
        }
        return _id
    }
    
    var name: String?{
        if _name == nil{
            _name = ""
        }
        return _name
    }
    
    var __description: String?{
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var start: String?{
        if _start == nil{
            _start = ""
        }
        return _start
    }
    
    var img_name: String?{
        if _img_name == nil{
            _img_name = ""
        }
        return _img_name
    }
    
    var type: String?{
        if _type == nil{
            _type = ""
        }
        return _type
    }
    
    var url: String?{
        if _url == nil{
            _url = ""
        }
        return _url
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
        _name = dictionary["name"] as? String
        _description = dictionary["description"] as? String
        _start = dictionary["start"] as? String
        _img_name = dictionary["img_name"] as? String
        _type = dictionary["type"] as? String
        _url = dictionary["url"] as? String
        _like_count = dictionary["like_count"] as? Int
        _like_status = dictionary["like_status"] as? Int
        
    }
}
