//
//  ChannelDetailItemsSquareTableViewCell.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/03/03.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit
import Kingfisher

class ChannelDetailItemsSquareTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func setup() {
        itemImageView.kf.setImage(with: "https://images-na.ssl-images-amazon.com/images/I/610AB%2BLL6wL.jpg".url!)
    }

}
