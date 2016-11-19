//
//  UserDefaults.swift
//  TMPlus
//
//  Created by SimpuMind on 11/16/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn
import TwitterKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView{
    
    func loadImageWithCache(urlString: String){
        
        self.image = nil
        
        if let cacheImage = imageCache.object(forKey: urlString as NSString){
            self.image = cacheImage
        }else{
            let url = NSURL(string: urlString)
            
            URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, response, error) in
                
                if error != nil{
                    print("\(error)")
                    return
                }
                DispatchQueue.main.async {
                    
                    if let imageDownload =  UIImage(data: data!){
                        imageCache.setObject(imageDownload, forKey: urlString as NSString)
                        self.image = imageDownload
                    }
                }
                
            }).resume()
        }
    }
}


extension UserDefaults{
    
    enum UserDefaultsKey: String {
        case isLoggedIn
    }
    
    func setIsLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKey.isLoggedIn.rawValue)
        synchronize()
    }
    
    func isLoggedIn() -> Bool{
        return bool(forKey: UserDefaultsKey.isLoggedIn.rawValue)
    }
    
    func saveUserDetails(user: User){
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: user)
        set(encodedData, forKey: "user")
        setIsLoggedIn(value: true)
        synchronize()
    }
    
    func fetchUserDetails() -> User{
        let decoded = object(forKey: "user") as! Data
        let decodedUser = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! User
        return decodedUser
    }
    
    func removeUserDetails(){
        let loginManager = FBSDKLoginManager()
        loginManager.logOut()
        
        Twitter.sharedInstance().sessionStore.logOutUserID(fetchUserDetails().id!)
        
        GIDSignIn.sharedInstance().signOut()
        
        setIsLoggedIn(value: false)
        let appDomain = Bundle.main.bundleIdentifier!
        removeVolatileDomain(forName: appDomain)
    }
}

extension UIView{
    
    func anchorToTop(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil) {
        
        anchorWithConstantsToTop(top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    }
    
    func anchorWithConstantsToTop(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0) {
        
        _ = anchor(top, left: left, bottom: bottom, right: right, topConstant: topConstant, leftConstant: leftConstant, bottomConstant: bottomConstant, rightConstant: rightConstant)
    }
    
    func anchor(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }
        
        if let left = left {
            anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
        }
        
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }
        
        if let right = right {
            anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
        }
        
        if widthConstant > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }
        
        if heightConstant > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }
        
        anchors.forEach({$0.isActive = true})
        
        return anchors
    }
}

extension UILabel {
    
    func autoresize() {
        if let textNSString: NSString = self.text as NSString? {
            let rect = textNSString.boundingRect(with: CGSize(width: self.frame.size.width, height: CGFloat.greatestFiniteMagnitude),
                                                         options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                         attributes: [NSFontAttributeName: self.font],
                                                         context: nil)
            self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: rect.height)
        }
    }
    
}

extension UIView {
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
}


