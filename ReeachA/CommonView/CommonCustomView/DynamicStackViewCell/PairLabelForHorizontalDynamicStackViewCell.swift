//
//  PairLabelForHorizontalDynamicStackViewCell.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/02/11.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class PairLabelForHorizontalDynamicStackViewCell: DynamicHorizontalStackViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var separatorWidth: NSLayoutConstraint!
    var pair:LabelPair?
    
    convenience init(pair:LabelPair) {
        self.init(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
        automaticDimension = true
        self.pair = pair
        separatorWidth.constant = UIScreen.px()
        update()
    }
    
    func update() {
        titleLabel.text = pair?.title?.name
        valueLabel.text = pair?.values.first?.name
        self.layoutIfNeeded()
    }
}
