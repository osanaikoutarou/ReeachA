//
//  UIView+ResolveConflict.swift
//  ReeachA
//
//  Created by osanai on 2019/10/08.
//  Copyright © 2019 長内幸太郎. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    /// 自動付与されたautoresizingMaskとAutoLayoutとの競合を解消する（子View含む）
    func resolveAutoLayoutConflict() {
        self.doSomethingAllSubviews { (view) in
//            if view.translatesAutoresizingMaskIntoConstraints == true {
//                print("😄😄  \(view.description)")
//            }
//            else {
//                print("😄👽  \(view.description)")
//            }

//            view.translatesAutoresizingMaskIntoConstraints = false
//            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }

    private func doSomethingAllSubviews(doing: (_ view: UIView) -> Void) {
        doing(self)
        self.subviews.forEach {
            $0.doSomethingAllSubviews(doing: doing)
        }
    }
}

extension UIViewController {
    func resolveAutoLayoutConflict() {
        view.resolveAutoLayoutConflict()
    }
}
