//
//  BaseCell.swift
//  TMPlus
//
//  Created by SimpuMind on 11/21/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        iv.image = UIImage(named: "tailor_swift_back")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let postTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "This is a sample title, and its going to be so long soon, please watch out for it"
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let postTimeTextView: UILabel = {
        let tv = UILabel()
        tv.text = "2 days ago"
        tv.font = UIFont.systemFont(ofSize: 10)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "This is mthe main content, this content shouldd be better than this long text"
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    let favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "star"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor =  UIColor(red: 200.0/255, green: 40.0/255, blue: 40.0/255.0, alpha: 1)
        return button
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "heart"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor =  UIColor(red: 200.0/255, green: 40.0/255, blue: 40.0/255.0, alpha: 1)
        return button
    }()
    
    let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "share"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor =  UIColor(red: 200.0/255, green: 40.0/255, blue: 40.0/255.0, alpha: 1)
        return button
    }()
    
    let likeCountLabel: UILabel = {
        let tv = UILabel()
        tv.text = "2"
        tv.font = UIFont.systemFont(ofSize: 10)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let readImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "eye")
        iv.tintColor = UIColor(red: 200.0/255, green: 40.0/255, blue: 40.0/255.0, alpha: 1)
        return iv
    }()
    
    let readLabel: UILabel = {
        let tv = UILabel()
        tv.text = "3"
        tv.font = UIFont.systemFont(ofSize: 10)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let directionImageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "ok_left")
        return iv
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        backgroundColor = .white
        
        addSubview(postImageView)
        addSubview(containerView)
        containerView.addSubview(postTitleLabel)
        containerView.addSubview(postTimeTextView)
        postImageView.addSubview(directionImageView)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(favoriteButton)
        containerView.addSubview(likeButton)
        containerView.addSubview(shareButton)
        containerView.addSubview(likeCountLabel)
        containerView.addSubview(readImageView)
        containerView.addSubview(readLabel)
    }
    
    func estimatedFrameForText(text: String, textSize: CGFloat) -> CGRect{
        
        let size = CGSize(width: 200, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin)
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: textSize)], context: nil)
    }
}
