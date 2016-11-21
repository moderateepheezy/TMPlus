//
//  FeedsCell.swift
//  TMPlus
//
//  Created by SimpuMind on 11/17/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit

class FeedsCell: BaseCell {
    
     override func setupViews(){
        super.setupViews()
        
        _ = directionImageView.anchor(postImageView.topAnchor, left: nil, bottom: nil, right: postImageView.rightAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 10, heightConstant: 10)
        
        _ = containerView.anchor(topAnchor, left: postImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 8, rightConstant: 8, widthConstant: frame.width, heightConstant: frame.height)
        
       _ = postImageView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 150, heightConstant: 150)
        
        _ = postTitleLabel.anchor(containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: containerView.frame.width, heightConstant: estimatedFrameForText(text: postTitleLabel.text!, textSize: 14).height)
        
        postTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        _ = postTimeTextView.anchor(postTitleLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: containerView.frame.width, heightConstant: 10)
        
        _ = descriptionLabel.anchor(postTitleLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 15, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: containerView.frame.width, heightConstant: estimatedFrameForText(text: descriptionLabel.text!, textSize: 12).height)
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        
        
        _ = shareButton.anchor(nil, left: nil, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 15, heightConstant: 15)
        
        _ = favoriteButton.anchor(nil, left: nil, bottom: containerView.bottomAnchor, right: shareButton.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 25, widthConstant: 15, heightConstant: 15)
        
        _ = likeButton.anchor(nil, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 15, heightConstant: 15)
        
        _ = likeCountLabel.anchor(nil, left: likeButton.rightAnchor, bottom: containerView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 15, heightConstant: 15)
        
         _ = readImageView.anchor(nil, left: likeCountLabel.rightAnchor, bottom: containerView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 15, heightConstant: 15)
        
        _ = readLabel.anchor(nil, left: readImageView.rightAnchor, bottom: containerView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 15, heightConstant: 15)

    }
    
    
}

class ReverseFeedsCell: BaseCell {
    
    
    override func setupViews(){
        super.setupViews()
        
        _ = directionImageView.anchor(postImageView.topAnchor, left: postImageView.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 10, heightConstant: 10)

        
        _ = containerView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 8, leftConstant: 8, bottomConstant: 8, rightConstant: 8, widthConstant: frame.width, heightConstant: frame.height)
        
        _ = postImageView.anchor(topAnchor, left: containerView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 150, heightConstant: 150)
        
        _ = postTitleLabel.anchor(containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: containerView.frame.width, heightConstant: estimatedFrameForText(text: postTitleLabel.text!, textSize: 14).height)
        
        postTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        _ = postTimeTextView.anchor(postTitleLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: containerView.frame.width, heightConstant: 10)
        
        _ = descriptionLabel.anchor(postTitleLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 15, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: containerView.frame.width, heightConstant: estimatedFrameForText(text: descriptionLabel.text!, textSize: 12).height)
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        
        
        _ = shareButton.anchor(nil, left: nil, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 15, heightConstant: 15)
        
        _ = favoriteButton.anchor(nil, left: nil, bottom: containerView.bottomAnchor, right: shareButton.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 25, widthConstant: 15, heightConstant: 15)
        
        _ = likeButton.anchor(nil, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 15, heightConstant: 15)
        
        _ = likeCountLabel.anchor(nil, left: likeButton.rightAnchor, bottom: containerView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 15, heightConstant: 15)
        
        _ = readImageView.anchor(nil, left: likeCountLabel.rightAnchor, bottom: containerView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 15, heightConstant: 15)
        
        _ = readLabel.anchor(nil, left: readImageView.rightAnchor, bottom: containerView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 15, heightConstant: 15)
        
    }
}
