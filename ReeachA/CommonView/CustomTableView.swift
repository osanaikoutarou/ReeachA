//
//  CustomTableView.swift
//  ReeachA
//
//  Created by osanai on 2019/09/11.
//  Copyright © 2019 長内幸太郎. All rights reserved.
//

import UIKit

class CustomTableView: UIScrollView {
    /// UIButton対応
    override func touchesShouldCancel(in view: UIView) -> Bool {
        return true
    }
}
