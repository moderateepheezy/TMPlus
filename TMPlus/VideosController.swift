//
//  VideosController.swift
//  TMPlus
//
//  Created by SimpuMind on 11/18/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit


class VideosController: UICollectionViewController,
UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let reverseCellId = "reverseCellId"
    
    var videos: [Video]?
    
    func fetchVideos(){
        ApiService.sharedInstance.fetchVideosFeeds { (videos) in
            self.videos = videos
            self.collectionView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchVideos()
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        //collectionView.ins
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 0.95)
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(FeedsCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(ReverseFeedsCell.self, forCellWithReuseIdentifier: reverseCellId)
        navigationItem.title = TABNAME.VIDEOS.rawValue
        
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
        return videos?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item % 2 == 1{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedsCell
            
            let post = videos?[indexPath.item]
            
            renderViewGravityLeft(cell: cell, post: post!)
            
            return cell

        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reverseCellId, for: indexPath) as! ReverseFeedsCell
        
        let post = videos?[indexPath.item]
        
        renderViewGrafityRight(cell: cell, post: post!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
    
    
    fileprivate func renderViewGravityLeft(cell: FeedsCell, post: Video){
        cell.postTitleLabel.text = post.title
        cell.postTimeTextView.text = post.published_at
        cell.descriptionLabel.text = post.__description
        cell.directionImageView.image = UIImage(named: "ok_left")
        cell.postImageView.loadImageWithCache(urlString: post.url!)
        
    }
    
    fileprivate func renderViewGrafityRight(cell: ReverseFeedsCell, post: Video){
        cell.postTitleLabel.text = post.title
        cell.postTimeTextView.text = post.published_at
        cell.descriptionLabel.text = post.__description
        cell.postImageView.loadImageWithCache(urlString: post.url!)
        cell.directionImageView.image = UIImage(named: "ok_right")
    }
    
}



