//
//  UIView+Autolayout.swift
//  EventWorks
//
//  Created by 長内幸太郎 on 2018/10/27.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func setConstraint(identifier:String, constant:CGFloat) {
        self.constraints.filter { $0.identifier == identifier }.forEach { $0.constant = constant }
    }
    
    func getConstraint(identifier:String) -> NSLayoutConstraint? {
        if let constraint = self.constraints.first(where: { $0.identifier == identifier }) {
            return constraint
        }
        return nil
    }
    
    func getConstraintConstant(identifier:String) -> CGFloat {
        if let constraint = self.constraints.first(where: { $0.identifier == identifier }) {
            return constraint.constant
        }
        return 0
    }
}
