//
//  UIView+ContainerView.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/09/09.
//  Copyright © 2019 長内幸太郎. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    // containerViewから該当ViewControllerを得る
    var containerViewController: UIViewController? {
        return subviews.first?.viewController
    }
}
