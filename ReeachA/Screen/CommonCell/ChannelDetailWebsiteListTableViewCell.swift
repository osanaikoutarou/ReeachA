//
//  ChannelDetailWebsiteListTableViewCell.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/02/02.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailWebsiteListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(webLink:WebLink) {
        titleLabel.text = webLink.title
        iconImageView.image = webLink.icon
    }
    
}
