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
        
       _ = postImageView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: frame.width / 2, heightConstant: 150)
        
        _ = shareButton.anchor(nil, left: nil, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 15, heightConstant: 15)

    }
    
    
}

class ReverseFeedsCell: BaseCell {
    
    
    override func setupViews(){
        super.setupViews()
        
        _ = directionImageView.anchor(postImageView.topAnchor, left: postImageView.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 10, heightConstant: 10)

        
        _ = containerView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 8, leftConstant: 8, bottomConstant: 8, rightConstant: 8, widthConstant: frame.width, heightConstant: frame.height)
        
        _ = postImageView.anchor(topAnchor, left: containerView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: frame.width / 2, heightConstant: 150)
        
        _ = shareButton.anchor(nil, left: nil, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 15, heightConstant: 15)
    }
}
