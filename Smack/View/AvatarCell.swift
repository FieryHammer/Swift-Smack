//
//  AvatarCell.swift
//  Smack
//
//  Created by Horvath, Mate on 2018. 10. 23..
//  Copyright © 2018. Finastra. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    func setupView(){
        layer.backgroundColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 10
        clipsToBounds = true
        
    }
}
