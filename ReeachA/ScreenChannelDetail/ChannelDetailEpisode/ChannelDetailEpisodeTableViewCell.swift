//
//  ChannelDetailEpisodeTableViewCell.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/02/15.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit
import WebKit

class ChannelDetailEpisodeTableViewCell: UITableViewCell {

    var tappedOfficialWebsiteAction:EmptyClosure?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(tappedOfficialWebsiteAction:EmptyClosure?) {
        self.tappedOfficialWebsiteAction = tappedOfficialWebsiteAction
    }
    
    @IBAction func tappedOfficialWebsite(_ sender: Any) {
        self.tappedOfficialWebsiteAction?()
    }
    

}
