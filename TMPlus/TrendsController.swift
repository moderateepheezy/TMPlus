//
//  TrendsController.swift
//  TMPlus
//
//  Created by SimpuMind on 11/21/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit

class TrendsController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 0.95)
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(TrendsCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TrendsCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 160)
    }
}
