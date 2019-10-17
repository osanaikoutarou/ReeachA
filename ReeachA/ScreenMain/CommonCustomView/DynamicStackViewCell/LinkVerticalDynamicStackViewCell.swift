//
//  WebVerticalDynamicStackViewCell.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/02/12.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class LinkVerticalDynamicStackViewCell: DynamicVerticalStackViewCell {

    @IBOutlet weak var buttonView: ButtonView! {
        didSet {
            buttonView.setup(type: .likeUITableViewCell)
        }
    }
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var arrowIcon: UIImageView!

    @IBOutlet weak var topPadding: NSLayoutConstraint!
    @IBOutlet weak var bottomPadding: NSLayoutConstraint!
    @IBOutlet weak var leftPadding: NSLayoutConstraint!
    @IBOutlet weak var rightPadding: NSLayoutConstraint!

    var padding: UIEdgeInsets = .zero {
        didSet {
            topPadding.constant = padding.top
            bottomPadding.constant = padding.bottom
            leftPadding.constant = padding.left
            rightPadding.constant = padding.right
        }
    }

    convenience init(webLink: WebLink) {
        self.init(frame: CGRect(x:0, y:0, width:1, height:1))
        
        iconImageView.image = webLink.icon
        titleLabel.text = webLink.title
        
        heightConstraint.constant = UIScreen.px()
        
    }

    var isIconHidden: Bool = false {
        didSet {
            iconImageView.superview!.isHidden = isIconHidden
        }
    }

    var arrowIconColor: UIColor = .darkGray {
        didSet {
            arrowIcon.image = UIImage(named: "icon_forward100")?.withRenderingMode(.alwaysTemplate)
            arrowIcon.tintColor = arrowIconColor
        }
    }

    @IBAction func tapped(_ sender: Any) {
        print("ほげ")
    }
}
