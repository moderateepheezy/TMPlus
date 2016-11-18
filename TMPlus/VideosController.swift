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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        //collectionView.ins
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 0.95)
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(FeedsCell.self, forCellWithReuseIdentifier: cellId)
        
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
    
}



