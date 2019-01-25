//
//  UIViewController+Shadow.swift
//  EventWorks
//
//  Created by 長内幸太郎 on 2018/04/24.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension UIViewController {
    func shadow(targetView:UIView, color:UIColor, offset:(width:CGFloat,height:CGFloat), opacity:Float, radius:CGFloat) {

        let shadowView = UIView()
        
        shadowView.snp.makeConstraints { (make) in
            make.center.equalTo(targetView.snp.center)
            make.width.equalTo(targetView.snp.width)
            make.height.equalTo(targetView.snp.height)
        }
        
        shadowView.backgroundColor = .clear
        
        shadowView.layer.cornerRadius = targetView.layer.cornerRadius
        shadowView.layer.masksToBounds = false
        
        shadowView.layer.shadowColor = color.cgColor
        shadowView.layer.shadowOpacity = opacity
        shadowView.layer.shadowOffset = CGSize(width: offset.width, height: offset.height)
        shadowView.layer.shadowRadius = radius
        
        // 以下、角丸パス追加とラスタライズで高速化
        shadowView.layer.shadowPath = UIBezierPath(roundedRect: shadowView.bounds, cornerRadius: targetView.layer.cornerRadius).cgPath
        shadowView.layer.shouldRasterize = true
        shadowView.layer.rasterizationScale = UIScreen.main.scale
        
        if let parentView = targetView.superview {
            parentView.insertSubview(shadowView, at: 0)
        }
    }
    
}
