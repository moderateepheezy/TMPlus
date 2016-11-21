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
        tabBar.backgroundColor = UIColor(red: 179.0/255, green: 13.0/255, blue: 13.0/255.0, alpha: 1)

        tabBar.isTranslucent = false
        
        let layout = UICollectionViewFlowLayout()
        let newsController = NewsController(collectionViewLayout: layout)
        let newsNavigationController = UINavigationController(rootViewController: newsController)
        newsNavigationController.title = TABNAME.NEWS.rawValue
        newsNavigationController.tabBarItem.image = UIImage(named: "news")
        newsNavigationController.navigationBar.isTranslucent = false
        
        let eventsController = EventsController(collectionViewLayout: layout)
        let eventNavigationController = UINavigationController(rootViewController: eventsController)
        eventNavigationController.title = TABNAME.EVENTS.rawValue
        eventNavigationController.tabBarItem.image = UIImage(named: "event")
        
        let trendController = TrendsController(collectionViewLayout: layout)
        let trendNavigationController = UINavigationController(rootViewController: trendController)
        trendNavigationController.title = TABNAME.TRENDS.rawValue
        trendNavigationController.tabBarItem.image = UIImage(named: "trend")
        
        let videoController = VideosController(collectionViewLayout: layout)
        let videoNavigationController = UINavigationController(rootViewController: videoController)
        videoNavigationController.title = TABNAME.VIDEOS.rawValue
        videoNavigationController.tabBarItem.image = UIImage(named: "video")
        
        viewControllers = [newsNavigationController, eventNavigationController, trendNavigationController, videoNavigationController]
        
        if isLoggedin(){
            print("Login")
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
