//
//  TrendCell.swift
//  TMPlus
//
//  Created by SimpuMind on 11/21/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit

class TrendsCell: UICollectionViewCell,
UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .red
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        return cv
    }()
    
    let cellId = "cellId"
    
    let trendTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "#VoteForTrump"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let tweetVolumeTextView: UITextView = {
       let tv = UITextView()
        tv.text = "18978 tweets"
        return tv
    }()
    
    let trendUsernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@Tolu"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    let tweeterIconImageView: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "twitter_icon")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .lightGray
        pc.currentPageIndicatorTintColor = UIColor.red
        pc.numberOfPages = 3
        return pc
    }()
    
    lazy var prevButton:  UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "back"), for: .normal)
        button.tintColor = UIColor(colorLiteralRed: 197/255, green: 13/255, blue: 13/255, alpha: 1)
        button.addTarget(self, action: #selector(skipPage), for: .touchUpInside)
        return button
    }()
    
    lazy var nextButton:  UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "forward"), for: .normal)
        button.tintColor = UIColor(colorLiteralRed: 197/255, green: 13/255, blue: 13/255, alpha: 1)
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        return button
    }()
    
    
    func nextPage(){
        
    
    }
    
    func skipPage(){
        
    }

    
    private func setupViews(){
        backgroundColor = .white
        addSubview(trendTitleLabel)
        addSubview(tweetVolumeTextView)
        addSubview(tweeterIconImageView)
        addSubview(trendUsernameLabel)
        addSubview(pageControl)
        addSubview(nextButton)
        addSubview(prevButton)
        addSubview(collectionView)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        _ = trendTitleLabel.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: frame.width, heightConstant: 20)
        
        _ = tweetVolumeTextView.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 10, rightConstant: 0, widthConstant: 100, heightConstant: 20)
        
        _ = trendUsernameLabel.anchor(trendTitleLabel.bottomAnchor, left: collectionView.leftAnchor, bottom: nil, right: collectionView.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: frame.width, heightConstant: 16)
        
        _ = tweeterIconImageView.anchor(nil, left: nil, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 5, rightConstant: 10, widthConstant: 20, heightConstant: 20)
        
        _ = pageControl.anchor(nil, left: leftAnchor, bottom: tweetVolumeTextView.topAnchor, right:rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: -5, rightConstant: 0, widthConstant: 0, heightConstant: 10)
        
        _ = collectionView.anchor(trendUsernameLabel.bottomAnchor, left: prevButton.rightAnchor, bottom: pageControl.topAnchor, right: nextButton.leftAnchor, topConstant: 5, leftConstant: 5, bottomConstant: 5, rightConstant: 5, widthConstant: frame.width, heightConstant: frame.height)
        
        _ = nextButton.anchor(self.centerYAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: -5, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 20, heightConstant: 20)
        
        _ = prevButton.anchor(self.centerYAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: -5, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
}
