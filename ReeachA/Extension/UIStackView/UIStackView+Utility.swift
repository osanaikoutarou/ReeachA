//
//  UIStackView+Utility.swift
//  ReeachA
//
//  Created by osanai on 2019/10/10.
//  Copyright © 2019 長内幸太郎. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView {
    func removeAll() {
        arrangedSubviews.forEach { (v) in
            remove(view: v)
        }
    }

    func remove(view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }
}
