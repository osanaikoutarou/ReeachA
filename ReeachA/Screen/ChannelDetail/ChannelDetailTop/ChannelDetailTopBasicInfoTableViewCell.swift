//
//  ChannelDetailTopBasicInfoTableViewCell.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/02/11.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailTopBasicInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var basicInfoStackView: DynamicStackView!

    var needRefresh: Bool = true

    
    func setup(anime:Anime) {

        if !needRefresh {
            return
        }
        
        anime.baseInfos.forEach { (infoPair) in
            let labelPair = LabelPair(id: nil, infoPair: infoPair)
            let cell = PairLabelForHorizontalDynamicStackViewCell(pair: labelPair)
            cell.width = 100.f
            basicInfoStackView.addCell(cell: cell)
        }

        needRefresh = false
    }

}
