//
//  DynamicStackViewCell.swift
//  DynamicStackView
//
//  Created by osanai on 2019/02/07.
//  Copyright © 2019年 osanai. All rights reserved.
//

import UIKit

class DynamicVerticalStackViewHeader: DynamicVerticalStackViewCell {
}
class DynamicVerticalStackViewFooter: DynamicVerticalStackViewCell {
}
class DynamicHorizontalStackViewHeader: DynamicHorizontalStackViewCell {
}
class DynamicHorizontalStackViewFooter: DynamicHorizontalStackViewCell {
}

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
    override var automaticDimension: Bool {
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
    override var automaticDimension: Bool {
        didSet {
            widthConstraint?.isActive = !automaticDimension
        }
    }
}

class DynamicStackViewCell: UIView {
    var contentView: UIView!
    
    // optional
    var identifier: String?
    
    var isHeader: Bool {
        return self is DynamicVerticalStackViewHeader || self is DynamicHorizontalStackViewHeader
    }
    var isFooter: Bool {
        return self is DynamicVerticalStackViewFooter || self is DynamicHorizontalStackViewFooter
    }
    
    var automaticDimension: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakefromnib")
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("init frame")
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("init coder")
//        commonInit()
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
        
        automaticDimension = true
    }

    var view: DynamicStackViewCell {
        return self
    }
}
