//
//  StackLabel.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/02/05.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class LabelPair: NSObject {
    var id:String?
    var title:String?
    var value:String?

    convenience init(id:String?, title:String?, value:String?) {
        self.init()
        self.id = id
        self.title = title
        self.value = value
    }
}

class PairLabelDynamicStackViewCell: DynamicVerticalStackViewCell {
    
    @IBOutlet weak var baseView: ButtonView!
    @IBOutlet weak var titleView: ButtonView!
    @IBOutlet weak var valueView: ButtonView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var separatorLabel: UILabel!
    
    @IBOutlet weak var baseViewHeight: NSLayoutConstraint!
    
    var pair:LabelPair?
    
    convenience init(pair:LabelPair) {
        self.init(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
        automaticDimension = true
        self.pair = pair
        update()
    }
    func update() {
        titleLabel.text = pair?.title
        valueLabel.text = pair?.value
        self.layoutIfNeeded()
    }
}

