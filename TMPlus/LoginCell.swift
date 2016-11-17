//
//  LoginCell.swift
//  TMPlus
//
//  Created by SimpuMind on 11/16/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn
import TwitterKit

class LoginCell: UICollectionViewCell, FBSDKLoginButtonDelegate{
    
    let logoImageView : UIImageView = {
        let image = UIImage(named: "tmpluslogo")
        let imageView = UIImageView()
        imageView.image = image
        return imageView
    }()
    
    let emailTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = "Enter Email"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    let passwordTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = "Enter Password"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var googleButton: GIDSignInButton = {
        let button = GIDSignInButton()
        button.style = .wide
        button.colorScheme = .dark
        return button
    }()
    
    
    lazy var facebookButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.delegate = self
        button.readPermissions = ["email", "public_profile"]
       // button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button 
    }()
    
    weak var delegate: LoginControllerDelegate?
    
    
    
    func handleLogin(){
        delegate?.finishLoggingIn()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        let twitterButton = TWTRLogInButton { (session, error) in
            if let unwrappedSession = session {
                
                let client = TWTRAPIClient.withCurrentUser()
                
                client.loadUser(withID: unwrappedSession.userID, completion: { (user, error) in
                    let usernameT = user?.name
                    let userID = user?.userID
                    let imageUrlT = URL(string: (user?.profileImageURL)!)
                    let emailT = user?.screenName
                    
                    let user = User(id: userID!, username: usernameT!, email: emailT!, imageUrl: imageUrlT!)
                    
                    UserDefaults.standard.saveUserDetails(user: user)
                    
                })
                self.delegate?.finishLoggingIn()
                
            } else {
                NSLog("Login error: %@", error!.localizedDescription);
            }
        }
        
        // TODO: Change where the log in button is positioned in your view
        addSubview(twitterButton)

        
       backgroundColor = UIColor(red:214.0/255.0, green:214.0/255.0, blue:214.0/255.0, alpha:1.0)
        
        addSubview(logoImageView)
        addSubview(emailTextField)
        addSubview(facebookButton)
        addSubview(googleButton)
        
        _ = logoImageView.anchor(centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -150, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 100, heightConstant: 100)
        
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        _ = facebookButton.anchor(logoImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
        
        _ = googleButton.anchor(facebookButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 29, bottomConstant: 0, rightConstant: 29, widthConstant: 0, heightConstant: 50)
        
        _ = twitterButton.anchor(googleButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did logout successfully")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start { (connection, result, error) in
            if error != nil {
                print("Failed to start graph \(error)")
                return
            }
            
            let res = result as! [String: AnyObject]
            
            
            
            let id: String = res["id"] as! String!
            let name: String = res["name"] as! String!
            let email: String = res["email"] as! String!
            
            guard let imageUrl = URL(string: "http://writedirection.com/website/wp-content/uploads/2016/09/blank-profile-picture-973460_960_720.png") else {
                return
            }
            
            let user = User(id: id, username: name, email: email, imageUrl: imageUrl)
            UserDefaults.standard.saveUserDetails(user: user)
            
            self.handleLogin()
            //print("username\(UserDefaults.standard.fetchUserDetails().username)")
            
        }
    }
    
}

class LeftPaddedTextField: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    
}



