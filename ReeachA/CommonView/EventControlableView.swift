//
//  EventControlableView.swift
//  EventControlableView
//
//  Created by osanai on 2019/09/13.
//  Copyright © 2019 osanai. All rights reserved.
//

import UIKit

/// 自身のViewはスルーするが、子Viewはタッチできる状態にするView
/// targetLvelを設定した場合、対象となるviewが深くなる
/// その場合は基本的に子viewはUIView1つであるとする
class EventControlableView: UIView {

    var targetLvel: Int = 0

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {

        guard let target = subview(level: targetLvel) else {
            return false
        }

        for v in target.subviews {
            if target.convert(v.frame, to: self).contains(point) {
                print("true")
                return true
            }
        }
        return false
    }
}

private extension UIView {
    func subview(level: Int) -> UIView? {
        if level <= 0 {
            return self
        }
        else {
            return subviews.first(where: { (view) -> Bool in
                view.self.isMember(of: UIView.self)
            })?.subview(level: level - 1) ?? nil
        }
    }

}
