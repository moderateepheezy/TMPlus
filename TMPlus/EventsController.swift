//
//  EventsController.swift
//  TMPlus
//
//  Created by SimpuMind on 11/18/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit
import Haneke

class EventsController: UICollectionViewController,
UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let reverseCellId = "reverseCellId"
    
    var events: [Event]?
    
    func fetchEvents(){
        ApiService.sharedInstance.fetchEventsFeeds { (events: [Event]) in
            
            self.events = events
            self.collectionView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchEvents()
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 0.95)
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(FeedsCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(ReverseFeedsCell.self, forCellWithReuseIdentifier: reverseCellId)
        
        navigationItem.title = TABNAME.EVENTS.rawValue
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleSignOut))
    }
    
    
    func handleSignOut(){
        UserDefaults.standard.removeUserDetails()
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item % 2 == 1{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedsCell
            
            let post = events?[indexPath.item]
            
            renderViewGravityLeft(cell: cell, post: post!)
            
            return cell
            
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reverseCellId, for: indexPath) as! ReverseFeedsCell
        
        let post = events?[indexPath.item]
        
        renderViewGrafityRight(cell: cell, post: post!)
        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 160)
    }
    
    
    fileprivate func renderViewGravityLeft(cell: FeedsCell, post: Event){
        cell.postTitleLabel.text = post.name
        cell.postTimeTextView.text = post.start
        cell.descriptionLabel.text = post.__description
        cell.directionImageView.image = UIImage(named: "ok_left")
        cell.postImageView.loadImageWithCache(urlString: post.img_name!)
        
    }
    
    fileprivate func renderViewGrafityRight(cell: ReverseFeedsCell, post: Event){
        
        let cache = Shared.imageCache
        cell.postTitleLabel.text = post.name
        cell.postTimeTextView.text = post.start
        cell.descriptionLabel.text = post.__description
        cell.directionImageView.image = UIImage(named: "ok_right")
        
        let URL = NSURL(string: post.img_name!)!
        
        let fetcher = NetworkFetcher<UIImage>(URL: URL as URL)
        cache.fetch(fetcher: fetcher).onSuccess { image in
            cell.postImageView.image = image
        }
    }

    
}


