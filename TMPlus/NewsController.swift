//
//  ViewController.swift
//  TMPlus
//
//  Created by SimpuMind on 11/15/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit


enum TABNAME: String {
    case NEWS = "News"
    case EVENTS = "Events"
    case TRENDS = "Trends"
    case VIDEOS = "Videos"
}

class NewsController: UICollectionViewController,
            UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        //collectionView.ins
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 0.95)
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(FeedsCell.self, forCellWithReuseIdentifier: cellId)
        
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
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedsCell
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }
    
    fileprivate func renderNewsToView(cell: FeedsCell, post: News){
        cell.postTitleLabel.text = post.title
        cell.postTimeTextView.text = post.timestamp
        cell.descriptionLabel.text = post.content
        cell.postImageView.loadImageWithCache(urlString: post.image!)
    }

}

