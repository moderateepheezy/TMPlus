//
//  MainNavigationController.swift
//  TMPlus
//
//  Created by SimpuMind on 11/16/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit

//class MainNavigationController: UINavigationController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.backgroundColor = .white
//        
//        //assume user is login
//        if isLoggedin(){
//            let homeController = HomeController()
//            viewControllers = [homeController]
//        }else{
//            perform(#selector(showLoginController), with: nil,afterDelay: 0.01)
//        }
//    }
//
//    fileprivate func isLoggedin() -> Bool {
//        return UserDefaults.standard.isLoggedIn()
//    }
//
//    func showLoginController(){
//        let loginController = LoginController()
//        present(loginController, animated: true, completion: {
//            //perphaps whe do something here later
//        })
//    }
//    
//}

class CustomTabController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = .white
        
        let homeController = HomeController()
        let homeNavigationController = UINavigationController(rootViewController: homeController)
        homeNavigationController.title = "News"
        homeNavigationController.tabBarItem.image = UIImage(named: "news")
        
        let eventsController = UIViewController()
        let eventNavigationController = UINavigationController(rootViewController: eventsController)
        eventNavigationController.title = "Events"
        eventNavigationController.tabBarItem.image = UIImage(named: "event")
        
        let trendController = UIViewController()
        let trendNavigationController = UINavigationController(rootViewController: trendController)
        trendNavigationController.title = "Trends"
        trendNavigationController.tabBarItem.image = UIImage(named: "trend")
        
        let videoController = UIViewController()
        let videoNavigationController = UINavigationController(rootViewController: videoController)
        videoNavigationController.title = "Videos"
        videoNavigationController.tabBarItem.image = UIImage(named: "video")
        
        if isLoggedin(){
            viewControllers = [homeNavigationController, eventNavigationController, trendNavigationController, videoNavigationController]
        }else{
            perform(#selector(showLoginController), with: nil,afterDelay: 0.01)
        }
    }
    
    fileprivate func isLoggedin() -> Bool {
        return UserDefaults.standard.isLoggedIn()
    }
    
    func showLoginController(){
        let loginController = LoginController()
        present(loginController, animated: true, completion: {
            //perphaps whe do something here later
        })
    }

}
