//
//  DynamicStackViewCell.swift
//  DynamicStackView
//
//  Created by osanai on 2019/02/07.
//  Copyright © 2019年 osanai. All rights reserved.
//

import UIKit

class DynamicVerticalStackViewCell: DynamicStackViewCell {
    var heightConstraint:NSLayoutConstraint?
    var height: CGFloat = 1.0 {
        didSet {
            if let heightConstraint = heightConstraint {
                contentView.removeConstraint(heightConstraint)
            }
            heightConstraint = contentView.heightAnchor.constraint(equalToConstant: height)
            heightConstraint?.isActive = true
        }
    }
    var automaticDimension: Bool = false {
        didSet {
            heightConstraint?.isActive = !automaticDimension
        }
    }
}

class DynamicHorizontalStackViewCell: DynamicStackViewCell {
    var widthConstraint:NSLayoutConstraint?
    var width: CGFloat = 1.0 {
        didSet {
            if let widthConstraint = widthConstraint {
                contentView.removeConstraint(widthConstraint)
            }
            widthConstraint = contentView.widthAnchor.constraint(equalToConstant: width)
            widthConstraint?.isActive = true
        }
    }
    var automaticDimension: Bool = false {
        didSet {
            widthConstraint?.isActive = !automaticDimension
        }
    }
}

class DynamicStackViewCell: UIView {
    var contentView: UIView!
    
    // optional
    var identifier: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        let className = String(describing: type(of: self))
        contentView = Bundle.main.loadNibNamed(className, owner: self, options: nil)?.first as? UIView
        addSubview(contentView)
        contentView.frame = self.frame
        
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

    var view: DynamicStackViewCell {
        return self
    }
}
