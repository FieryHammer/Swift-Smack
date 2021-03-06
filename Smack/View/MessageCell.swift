//
//  MessageCell.swift
//  Smack
//
//  Created by Horvath, Mate on 2018. 10. 29..
//  Copyright © 2018. Finastra. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var userImage: CircleImage!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var messageBodyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with message: Message) {
        messageBodyLbl.text = message.messageBody
        userNameLbl.text = message.userName
        userImage.image = UIImage(named: message.userAvatar)
        userImage.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.SSS'Z'"
        let date = dateFormatter.date(from: message.timeStamp)
        dateFormatter.dateFormat = "MMM d, h:mm a"
        
        guard let dateUnwrapped = date else { return }
        timestampLabel.text = dateFormatter.string(from: dateUnwrapped) 
    }
}
