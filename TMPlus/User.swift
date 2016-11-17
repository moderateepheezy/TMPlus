//
//  User.swift
//  TMPlus
//
//  Created by SimpuMind on 11/16/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit

class User: NSObject, NSCoding {
    
    var id: String?
    var username: String?
    var email: String?
    var imageUrl: URL?
    
    init(id: String, username: String, email: String, imageUrl: URL) {
        self.id = id
        self.username = username
        self.email = email
        self.imageUrl = imageUrl
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeObject(forKey: "id") as! String
        let username = aDecoder.decodeObject(forKey: "name") as! String
        let email = aDecoder.decodeObject(forKey: "email") as! String
        let imageUrl = aDecoder.decodeObject(forKey: "imageUrl") as! URL
        self.init(id: id, username: username, email: email, imageUrl: imageUrl)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(username, forKey: "name")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(imageUrl, forKey: "imageUrl")
    }
}
