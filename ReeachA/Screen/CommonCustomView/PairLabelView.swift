//
//  StackLabel.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/02/05.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class PairLabelView: UIView {
    @IBOutlet weak var contentView: ButtonView!
    
    @IBOutlet weak var baseView: ButtonView!
    @IBOutlet weak var titleView: ButtonView!
    @IBOutlet weak var valueView: ButtonView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var separatorLabel: UILabel!
    
    @IBOutlet weak var baseViewHeight: NSLayoutConstraint!
    
    func setup(title:String?, value:String?) {
        titleLabel.text = title
        valueLabel.text = value
        self.layoutIfNeeded()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
//        baseView.type = .noChange
        
        Bundle.main.loadNibNamed("PairLabelView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        
        self.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-0-[contentView]-0-|",
                options: .directionLeadingToTrailing,
                metrics: nil,
                views: ["contentView": contentView]))
        self.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-0-[contentView]-0-|",
                options: .directionLeadingToTrailing,
                metrics: nil,
                views: ["contentView": contentView]))
    }
}

