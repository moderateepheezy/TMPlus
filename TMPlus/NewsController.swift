//
//  ViewController.swift
//  TMPlus
//
//  Created by SimpuMind on 11/15/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit

class NewsController: UICollectionViewController,
            UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    let reverseCellId = "reverseCellId"
    
    var news: [News]?
    
    func fetchNews(){
        ApiService.sharedInstance.fetchNewsFeeds { (news) in
            self.news = news
            self.collectionView?.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 0.95)
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(FeedsCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(ReverseFeedsCell.self, forCellWithReuseIdentifier: reverseCellId)
        
        navigationItem.title = TABNAME.NEWS.rawValue
        
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
        return news?.count ?? 0    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item % 2 == 1{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedsCell
            
            let post = news?[indexPath.item]
            
            renderViewGravityLeft(cell: cell, post: post!)
            
            return cell
            
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reverseCellId, for: indexPath) as! ReverseFeedsCell
        
        let post = news?[indexPath.item]
        
        renderViewGrafityRight(cell: cell, post: post!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
    
    
    fileprivate func renderViewGravityLeft(cell: FeedsCell, post: News){
        cell.postTitleLabel.text = post.title
        cell.postTimeTextView.text = post.timestamp
        cell.descriptionLabel.text = post.content
        cell.directionImageView.image = UIImage(named: "ok_left")
        cell.postImageView.loadImageWithCache(urlString: post.image!)
        cell.likeCountLabel.text = String(describing: post.like_count)
        cell.readLabel.text = String(describing: post.read_count)
    }
    
    fileprivate func renderViewGrafityRight(cell: ReverseFeedsCell, post: News){
        cell.postTitleLabel.text = post.title
        cell.postTimeTextView.text = post.timestamp
        cell.descriptionLabel.text = post.content
        cell.directionImageView.image = UIImage(named: "ok_right")
        cell.postImageView.loadImageWithCache(urlString: post.image!)
        cell.likeCountLabel.text = String(describing: post.like_count)
        cell.readLabel.text = String(describing: post.read_count)
    }

}

