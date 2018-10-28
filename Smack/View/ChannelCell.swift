//
//  ChannelCell.swift
//  Smack
//
//  Created by Horvath, Mate on 2018. 10. 28..
//  Copyright © 2018. Finastra. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    @IBOutlet weak var channelNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        } else {
            layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func configureCell(channel: Channel) {
        channelNameLbl.text = "#\(channel.name ?? "")"
    }

}
