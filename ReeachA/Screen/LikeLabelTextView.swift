//
//  LikeLabelTextView.swift
//  LikeLabelTextView
//
//  Created by osanai on 2019/02/27.
//  Copyright © 2019年 osanai. All rights reserved.
//

import UIKit

class LikeLabelTextView: UITextView {
    
    // TextViewの元のInsetsを使用する場合にonとする
    @IBInspectable var useDefaultInsets: Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    func setup() {
        if !useDefaultInsets {
            textContainer.lineFragmentPadding = 0
            textContainerInset = .zero
        }
        
        clipsToBounds = false
        isScrollEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        bounces = false
        isEditable = false
    }

}
