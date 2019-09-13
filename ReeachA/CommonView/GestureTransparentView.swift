//
//  GestureTransparentView.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/09/12.
//  Copyright © 2019 長内幸太郎. All rights reserved.
//

import UIKit

/// subviewだけgestureを有効に
class GestureTransparentView: UIView {

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {

        for v in subviews {
            if v.frame.contains(point) {
                return true
            }
        }

        return false
    }
}
