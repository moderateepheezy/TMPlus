//
//  News.swift
//  TMPlus
//
//  Created by SimpuMind on 11/19/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit

class News: NSObject, JSONDecodable{
    
    fileprivate var _title: String!
    fileprivate var _href: String!
    fileprivate var _image: String!
    fileprivate var _content: String!
    fileprivate var _timestamp: String!
    fileprivate var _news_id: Int!
    fileprivate var _type: String!
    fileprivate var _comments: Int!
    fileprivate var _flag: String!
    fileprivate var _ext_date: String!
    fileprivate var _like_status: Int!
    fileprivate var _like_count: Int!
    fileprivate var _read_count: Int!
    fileprivate var _dislike_count: Int!
    fileprivate var _read_status: Int!
    fileprivate var _arch_status: Int!
    var _checked: Bool?
    var _isFaved: Bool?
    
    var title: String{
        if _title == nil{
            _title = ""
        }
        return _title
    }
    
    var href: String?{
        if _href == nil{
            _href = ""
        }
        return _href
    }
    
    var image: String?{
        if _image == nil{
            _image = ""
        }
        return _image
    }
    
    var content: String?{
        if _content == nil{
            _content = ""
        }
        return _content
    }
    
    var timestamp: String?{
        if _timestamp == nil{
            _timestamp = ""
        }
        return _timestamp
    }
    
    var news_id: Int?{
        if _news_id == nil{
            _news_id = 0
        }
        return _news_id
    }
    
    var type: String?{
        if _type == nil{
            _type = ""
        }
        return _type
    }
    
    var comment: Int?{
        if _comments == nil{
            _comments = 0
        }
        return _comments
    }
    
    var flag: String?{
        if _flag == nil{
            _flag = ""
        }
        return _flag
    }
    
    var ext_date: String?{
        if _ext_date == nil{
            _ext_date = ""
        }
        return _ext_date
    }
    
    var like_status: Int?{
        if _like_status == nil{
            _like_status = 0
        }
        return _like_status
    }
    
    var like_count: Int?{
        if _like_count == nil{
            _like_count = 0
        }
        return _like_count
    }
    
    var read_count: Int?{
        if _read_count == nil{
            _read_count = 0
        }
        return _read_count
    }
    
    var dislike_count: Int?{
        if _dislike_count == nil{
            _dislike_count = 0
        }
        return _dislike_count
    }
    
    var read_status: Int?{
        if _read_status == nil{
            _read_status = 0
        }
        return _read_status
    }
    
    var arch_status: Int?{
        if _arch_status == nil{
            _arch_status = 0
        }
        return _arch_status
    }
    
    init(notLogIndict: [String: AnyObject]) {
        super.init()
        _title = notLogIndict["title"] as? String
        _href = notLogIndict["href"] as? String
        _image = notLogIndict["image"] as? String
        _content = notLogIndict["content"] as? String
        _timestamp = notLogIndict["timestamp"] as? String
        _news_id = notLogIndict["news_id"] as? Int
        _type = notLogIndict["type"] as? String

    }
    
    init(dictionary: [String: AnyObject]) {
        super.init()
        
        _title = dictionary["title"] as? String
        _href = dictionary["href"] as? String
        _image = dictionary["image"] as? String
        _content = dictionary["content"] as? String
        _timestamp = dictionary["timestamp"] as? String
        _news_id = dictionary["news_id"] as? Int
        _type = dictionary["type"] as? String
        _comments = dictionary["comments"] as? Int
        _flag = dictionary["flag"] as? String
        _ext_date = dictionary["ext_date"] as? String
        _like_status = dictionary["like_status"] as? Int
        _like_count = dictionary["like_count"] as? Int
        _read_count = dictionary["read_count"] as? Int
        _dislike_count = dictionary["dislike_count"] as? Int
        _read_count = dictionary["read_count"] as? Int
        _arch_status = dictionary["arch_status"] as? Int
        
    }
    
    required init(_ json: [String: Any]) {
        super.init()
        _title = json["title"] as? String
        _href = json["href"] as? String
        _image = json["image"] as? String
        _content = json["content"] as? String
        _timestamp = json["timestamp"] as? String
        _news_id = json["news_id"] as? Int
        _type = json["type"] as? String
        _comments = json["comments"] as? Int
        _flag = json["flag"] as? String
        _ext_date = json["ext_date"] as? String
        _like_status = json["like_status"] as? Int
        _like_count = json["like_count"] as? Int
        _read_count = json["read_count"] as? Int
        _dislike_count = json["dislike_count"] as? Int
        _read_count = json["read_count"] as? Int
        _arch_status = json["arch_status"] as? Int
    }
    
    
}
