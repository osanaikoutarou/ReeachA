//
//  StackLabel.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/02/05.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class PairLabelDynamicStackViewCell: DynamicVerticalStackViewCell {
    
    @IBOutlet weak var baseView: ButtonView!
    @IBOutlet weak var titleView: ButtonView!
    @IBOutlet weak var valueView: UIView!
    @IBOutlet weak var valueStackView: UIStackView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var separatorLabel: UILabel!
    
    var valueViews:[ButtonView] = []
    var valueLabels:[UILabel] = []
    
    var pair:LabelPair?
    
    convenience init(pair:LabelPair) {
        self.init(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
        automaticDimension = true
        self.pair = pair
        update()
    }
    func update() {
        titleLabel.text = pair?.title?.name
        
        pair?.values.forEach {
            let buttonView = ButtonView(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
            valueLabels.append(label)
            label.text = $0.name
            label.font = UIFont(name: titleLabel.font.familyName, size: 11.f)
            label.numberOfLines = 0
            buttonView.addSubview(label)
            label.bindFrameToSuperviewBounds()
            valueViews.append(buttonView)
            valueStackView.addArrangedSubview(buttonView)
        }
        
        self.layoutIfNeeded()
    }
    func setFont(font:UIFont) {
        titleLabel.font = font
        valueLabels.forEach{ $0.font = font }
    }
    func setFontSize(size:CGFloat) {
        titleLabel.font = UIFont(name: titleLabel.font.familyName, size: size)
        valueLabels.forEach{ $0.font = UIFont(name: valueLabels.first!.font.familyName, size: size) }
        separatorLabel.font = UIFont(name: separatorLabel.font.familyName, size: size)
    }
    
    func setTitleWidth(width:CGFloat) {
        titleLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
}

