//
//  ChannelDetailTopSummaryTableViewCell.swift
//  ReeachA
//
//  Created by osanai on 2019/02/08.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailTopSummaryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var captioinImageView: UIImageView!
    @IBOutlet weak var infoDynamicStackView: DynamicStackView!
    
    var needRefresh: Bool = true
    
    func setup(infoPairs:[InfoPair]) {
        if !needRefresh {
            return
        }

        infoPairs.forEach { (infoPair) in
            let labelPair = LabelPair(id: nil, infoPair: infoPair)
            let cell = PairLabelDynamicStackViewCell(pair: labelPair)
            
            cell.automaticDimension = true
            cell.setFontSize(size: 12.f)
            cell.setTitleWidth(width: 70.f)
            infoDynamicStackView.addCell(cell: cell)
        }

        needRefresh = false
    }

}
