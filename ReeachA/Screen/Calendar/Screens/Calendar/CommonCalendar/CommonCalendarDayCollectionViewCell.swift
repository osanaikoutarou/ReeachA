//
//  CommonCalendarDayCollectionViewCell.swift
//  WeekCalendarExample
//
//  Created by osanai on 2019/05/30.
//  Copyright © 2019 osanai. All rights reserved.
//

import UIKit

class CommonCalendarDayCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        label.text = "21"
    }

}
