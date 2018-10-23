//
//  CircleImage.swift
//  Smack
//
//  Created by Horvath, Mate on 2018. 10. 23..
//  Copyright © 2018. Finastra. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    func setupView() {
        layer.cornerRadius = frame.width / 2
        clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setupView()
    }

}
