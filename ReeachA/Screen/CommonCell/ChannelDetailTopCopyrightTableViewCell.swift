//
//  ChannelDetailTopCopyrightTableViewCell.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/02/10.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailTopCopyrightTableViewCell: UITableViewCell {
    
    @IBOutlet weak var copyrightLabel: UILabel!

    func setup(channel:Channel) {
        copyrightLabel.text = channel.copyright
    }

}
