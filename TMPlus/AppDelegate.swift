//
//  AppDelegate.swift
//  TMPlus
//
//  Created by SimpuMind on 11/15/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit
import CoreData
import FBSDKCoreKit
import GoogleSignIn
import Google
import Fabric
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Fabric.with([Twitter.self])
        
        var configureError: NSError?
        
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
        
        GIDSignIn.sharedInstance().delegate = self
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        window?.rootViewController = CustomTabController()
        
        //rgb(213,48,48)
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 179.0/255, green: 13.0/255, blue: 13.0/255.0, alpha: 1)
        
        UITabBar.appearance().tintColor = UIColor(red: 179.0/255, green: 13.0/255, blue: 13.0/255.0, alpha: 1)
        
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        //UIStatus
        
//        let statusBarBackgroundView = UIView()
//        statusBarBackgroundView.backgroundColor = UIColor(red: 200.0/255, green: 40.0/255, blue: 40.0/255.0, alpha: 1)
//        statusBarBackgroundView.translatesAutoresizingMaskIntoConstraints = false
//        window?.addSubview(statusBarBackgroundView)
//        
//        statusBarBackgroundView.leftAnchor.constraint(equalTo: (window?.leftAnchor)!).isActive = true
//        statusBarBackgroundView.rightAnchor.constraint(equalTo: (window?.rightAnchor)!).isActive = true
//        statusBarBackgroundView.widthAnchor.constraint(equalTo: (window?.widthAnchor)!).isActive = true
//        statusBarBackgroundView.topAnchor.constraint(equalTo: (window?.topAnchor)!).isActive = true
//        
//        statusBarBackgroundView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        return true
    }
    
    
    weak var delegate: LoginControllerDelegate?
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            print("Login to Google Successful")
            let id = user.userID
            let username = user.profile.name
            let email = user.profile.email
            
            if user.profile.hasImage{
                
                guard let imageUrl = user.profile.imageURL(withDimension: 120) else {
                    return
                }
                
                let user = User(id: id!, username: username!, email: email!, imageUrl: imageUrl)
                
                UserDefaults.standard.saveUserDetails(user: user)
                
            }else{
                guard let imageUrl = URL(string: "http://writedirection.com/website/wp-content/uploads/2016/09/blank-profile-picture-973460_960_720.png") else {
                    return
                }
                
                let user = User(id: id!, username: username!, email: email!, imageUrl: imageUrl)
                UserDefaults.standard.saveUserDetails(user: user)

                
            }
           
            
            //delegate?.finishLoggingIn()
            window?.rootViewController = CustomTabController()
        } else {
            print("Login to Google failed with: \(error)")
        }
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String!, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
        GIDSignIn.sharedInstance().handle(url,
                                             sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                             annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
        
        return handled
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "TMPlus")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

