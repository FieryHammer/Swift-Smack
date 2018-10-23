//
//  AvatarCell.swift
//  Smack
//
//  Created by Horvath, Mate on 2018. 10. 23..
//  Copyright © 2018. Finastra. All rights reserved.
//

import UIKit

enum AvatarType {
    case dark
    case light
}

class AvatarCell: UICollectionViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    func configureCell(with index: Int, type: AvatarType) {
        if type == AvatarType.dark {
            avatarImageView.image = UIImage(named: "dark\(index)")
            layer.backgroundColor = UIColor.lightGray.cgColor
        }
        else {
            avatarImageView.image = UIImage(named: "light\(index)")
            layer.backgroundColor = UIColor.gray.cgColor
        }
    }
    
    func setupView(){
        layer.backgroundColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 10
        clipsToBounds = true
        
    }
}
