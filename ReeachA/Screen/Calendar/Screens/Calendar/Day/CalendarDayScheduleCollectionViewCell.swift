//
//  CalendarDayCollectionViewCell.swift
//  WeekCalendarExample
//
//  Created by osanai on 2019/05/29.
//  Copyright © 2019 osanai. All rights reserved.
//

import UIKit

class CalendarDayScheduleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var dayView: UIView!
    var shadowView: ShadowView?

    @IBOutlet weak var dateLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        addShadow()
    }

    func addShadow() {
        if shadowView != nil {
            return
        }

        layoutIfNeeded()
        shadowView = ShadowView()

        shadowView!.translatesAutoresizingMaskIntoConstraints = true
        shadowView!.frame = dayView.frame

        shadowView!.addShadow(shadowColor: .black,
                             shadowOffset: CGSize(width: 0, height: 2),
                             shadowOpacity: 0.15,
                             shadowRadius: 8,
                             cornerRadius: dayView.layer.cornerRadius)

        self.insertSubview(shadowView!, at: 0)
    }


    
}
