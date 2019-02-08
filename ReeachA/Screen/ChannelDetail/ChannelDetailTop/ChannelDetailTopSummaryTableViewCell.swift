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
    
    var channel:Anime = Anime()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        channel.createSample()
        
        channel.topInfos.forEach { (infoPair) in
            let title = infoPair.title.name
            let value = infoPair.contents.reduce("", { $0 + $1.name + " "})
            let labelPair = LabelPair(id: nil, title: title, value: value)
            
            infoDynamicStackView.addCell(cell: PairLabelDynamicStackViewCell(pair: labelPair))
        }
    }


}
