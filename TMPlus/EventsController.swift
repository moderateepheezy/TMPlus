//
//  EventsController.swift
//  TMPlus
//
//  Created by SimpuMind on 11/18/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit

class EventsController: UICollectionViewController,
UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedsCell
        
        //let post = Events?[indexPath.item]
        
        //renderEventToView(cell: cell, post: post!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
    
    
    fileprivate func renderViewGravityLeft(cell: FeedsCell, post: Event){
        cell.postTitleLabel.text = post.name
        cell.postTimeTextView.text = post.start
        cell.descriptionLabel.text = post.__description
        cell.directionImageView.image = UIImage(named: "ok_left")
        cell.postImageView.loadImageWithCache(urlString: post.img_name!)
        
    }
    
    fileprivate func renderViewGrafityRight(cell: ReverseFeedsCell, post: Event){
        
        cell.postTitleLabel.text = post.name
        cell.postTimeTextView.text = post.start
        cell.descriptionLabel.text = post.__description
        cell.directionImageView.image = UIImage(named: "ok_right")
        cell.postImageView.loadImageWithCache(urlString: post.img_name!)
    }

    
}


