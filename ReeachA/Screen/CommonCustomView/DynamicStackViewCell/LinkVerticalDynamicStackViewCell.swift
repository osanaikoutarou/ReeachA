//
//  WebVerticalDynamicStackViewCell.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/02/12.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class LinkVerticalDynamicStackViewCell: DynamicVerticalStackViewCell {

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    convenience init(webLink: WebLink) {
        self.init(frame: CGRect(x:0, y:0, width:1, height:1))
        
        iconImageView.image = webLink.icon
        titleLabel.text = webLink.title
        
        heightConstraint.constant = UIScreen.px()
        
    }

}
