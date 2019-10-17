//
//  PairLabelTableViewCell.swift
//  ReeachA
//
//  Created by osanai on 2019/10/10.
//  Copyright © 2019 長内幸太郎. All rights reserved.
//

import UIKit

class PairLabelTableViewCell: UITableViewCell {

    @IBOutlet weak var baseView: ButtonView!
    @IBOutlet weak var titleView: ButtonView!
    @IBOutlet weak var valueView: UIView!
    @IBOutlet weak var valueStackView: UIStackView!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var separatorLabel: UILabel!

    // layout
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleWidth: NSLayoutConstraint!
    @IBOutlet weak var separatorWidth: NSLayoutConstraint!

    var valueViews:[ButtonView] = []
    var valueLabels:[UILabel] = []

    var labelPair:LabelPair?

    override func prepareForReuse() {
        valueStackView.removeAll()
    }

    func setup(labelPair: LabelPair) {
        self.labelPair = labelPair

        titleLabel.text = labelPair.title?.name

        labelPair.values.forEach {
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
        valueStackView.spacing = 8.f

        // デザイン
        titleWidth.constant = UIScreen.main.bounds.width * 0.2
        topConstraint.constant = 5
        bottomConstraint.constant = 5
        leftConstraint.constant = 25
        rightConstraint.constant = 25
        separatorWidth.constant = 50

    }
    func setFont(font:UIFont) {
        titleLabel.font = font
        valueLabels.forEach{ $0.font = font }
        separatorLabel.font = font
    }
    func setFontSize(size:CGFloat) {
        titleLabel.font = UIFont(name: titleLabel.font.familyName, size: size)
        valueLabels.forEach{ $0.font = UIFont(name: valueLabels.first!.font.familyName, size: size) }
        separatorLabel.font = UIFont(name: separatorLabel.font.familyName, size: size)
    }
    func setTextColor(color: UIColor) {
        titleLabel.textColor = color
        valueLabels.forEach{ $0.textColor = color }
        separatorLabel.textColor = color
    }
    var isSeparatorHidden: Bool = false {
        didSet {
            separatorLabel.isHidden = isSeparatorHidden
        }
    }

    func setTitleWidth(width:CGFloat) {
        titleLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
    }

}
